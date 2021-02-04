RSpec.describe 'GET /api/foodbags' do
  let!(:foodbags) { 5.times { create(:foodbag) } }
  let(:recipient) { create(:recipient) }
  let(:recipient_headers) { recipient.create_new_auth_token }

  describe 'GET /api/foodbags' do
    before do
      get '/api/foodbags',
          headers: recipient_headers
    end

    it 'is expected to return a 200' do
      expect(response).to have_http_status 200
    end

    it 'is expected to return a collection of foodbags' do
      expect(response_json['foodbags'].first['pickuptime']).to eq 'morning'
    end
  end
end
