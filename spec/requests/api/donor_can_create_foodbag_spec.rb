RSpec.describe 'POST /api/foodbags', type: :request do
  let(:donor) { create(:donor) }
  let(:headers) { donor.create_new_auth_token }
  describe 'successfully create a foodbag' do
    before do
      post '/api/foodbags',
           params: {
             foodbag: {
               pickuptime: 'morning'
             }
           },
           headers: headers
    end

    it 'is expected to return a 201' do
      expect(response).to have_http_status 201
    end
    it 'is expected to return a success message' do
      expect(response_json['message']).to eq 'Your foodbag was successfully created!'
    end
  end

  describe 'unsuccessfully create a foodbag without pickup time' do
    before do
      post '/api/foodbags',
           params: {
             foodbag: {
               pickuptime: ''

             }
           },
           headers: headers
    end

    it 'is expected to return a 422' do
      expect(response).to have_http_status 422
    end

    it 'is expected to return a error message' do
      expect(response_json['message']).to eq "Pickuptime can't be blank"
    end
  end

  describe 'unsuccessfully create a foodbag without valid credentials' do
    before do
      post '/api/foodbags',
           params: {
             foodbag: {
               pickuptime: 'evening',
               status: 'available'
             }
           }
    end

    it 'is expected to return a 401' do
      expect(response).to have_http_status 401
    end

    it 'is expected to return a error message' do
      expect(response_json).to have_key('errors').and have_value(['You need to sign in or sign up before continuing.'])
    end
  end
end
