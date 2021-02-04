RSpec.describe 'PUT /api/foodbags/:id', type: :request do
  let(:foodbag) { create(:foodbag) }
  let(:recipient) { create(:recipient) }
  let(:recipient_headers) { recipient.create_new_auth_token }

  describe 'recipient can reserv a foodbag' do
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
      expect(foodbag.reload.user_id).to eq recipient.id
    end
  end
end
