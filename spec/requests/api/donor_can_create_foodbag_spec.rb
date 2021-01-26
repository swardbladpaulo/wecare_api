RSpec.describe 'POST /api/foodbags', type: :request do
  let!(:donor_id) { create(:donor) }

  describe 'successfully create a foodbag' do
    before do
      post '/api/foodbags', {
        params: {
          foodbag: {
            pickup_time: pickup_time.id,
            status: status.id,
            donor_id: donor.id 
          }
        },
        headers: donor_headers
      }
    end
    
    it 'is expected to return a 201' do
      expect(response).to have_http_status 201
    end
    it 'is expected to return a success message' do
      expect(response_json['message']).to eq 'Your foodbag was successfully created!'
    end
    it 'is expected to have a pickup time' do
      expect
    end
  
  end
end

