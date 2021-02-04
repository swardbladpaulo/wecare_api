RSpec.describe 'PUT /api/foodbags/:id', type: :request do
  let(:foodbag) { create(:foodbag) }
  let(:recipient) { create(:recipient) }
  let(:recipient_headers) { recipient.create_new_auth_token }

  describe 'recipient can successfully reserv a foodbag' do
    before do
      put "/api/foodbags/#{foodbag.id}",
          params: {
            foodbag: {
              status: 'reserved'
            }
          },
          headers: recipient_headers
    end

    it 'ist expected ro return a 200' do
      expect(response).to have_http_status 200
    end

    it 'is expected to return a success message' do
      expect(response_json['message']).to eq 'Your foodbag is reserved!'
    end

    it 'is expected to belong to the current user' do
      expect(foodbag.reload.recipient_id).to eq recipient.id
    end
  end

  describe "visitor can't reserv a foodbag" do
    before do
      put "/api/foodbags/#{foodbag.id}",
          params: {
            foodbag: {
              status: 'reserved'
            }
          }
    end

    it 'ist expected ro return a 401' do
      expect(response).to have_http_status 401
    end

    it 'is expected to return an error message' do
      expect(response_json).to have_key('errors').and have_value(['You need to sign in or sign up before continuing.'])
    end
  end

  describe "recipient can't reserv a foodbag without valid status" do
    before do
      put "/api/foodbags/#{foodbag.id}",
          params: {
            foodbag: {
              status: ''
            }
          },
          headers: recipient_headers
    end

    it 'ist expected ro return a 422' do
      expect(response).to have_http_status 422
    end

    it 'is expected to return an error message' do
      expect(response_json).to have_key('message').and have_value("Status can't be blank")
    end
  end
end
