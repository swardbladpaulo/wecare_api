RSpec.describe 'POST /api/foodbags', type: :request do
  let(:donor) { create(:donor)}
  describe 'successfully create a foodbag' do
    before do
      post '/api/foodbags', {
        params: {
          foodbag: {
            pickuptime: :morning,
            status: :available,
            donor_id: donor.id
          }
        }
      }
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
      post '/api/foodbags', {
        params: {
          foodbag: {
            pickuptime: '',
            status: :available,
            donor_id: donor.id
          }
        }
      }
    end

    it 'is expected to return a 422' do
      expect(response).to have_http_status 422
    end

    it 'is expected to return a error message' do
      expect(response_json['message']).to eq "Pickuptime can't be blank"
    end
  end

  describe 'unsuccessfully create a foodbag without status available' do
    before do
      post '/api/foodbags', {
        params: {
          foodbag: {
            pickuptime: :evening,
            status: '',
            donor_id: donor.id

          }
        }
      }
    end

    it 'is expected to return a 422' do
      expect(response).to have_http_status 422
    end

    it 'is expected to return a error message' do
      expect(response_json['message']).to eq "Status can't be blank"
    end
  end
end
