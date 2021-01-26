Rspec.describe 'POST/api/foodbags', type: :request do

  describe 'successfully create a foodbag' do
    before do
      post '/api/foodbags'
    end
    
    it 'is expected to return a 201' do
      expect(response).to have_http_status 201
    end

    it 'is expected to return a success message' do
      expect(response_json['message'].to eq 'Your foodbag was successfully created!')
    end
  end
end

