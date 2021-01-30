RSpec.describe "GET /api/foodbags" do
  let!(:foodbags) {5.times{create(:foodbag)}}
  
  describe "GET /api/foodbags" do
    before do
      get "/api/foodbags"
    end

    it 'is expected to return a 200' do
      expect(response).to have_http_status 200
    end

    it "is expected to return a collection of foodbags" do
      expect(response_json['foodbags'].first['pickuptime']).to eq 'morning'
    end
  end
end