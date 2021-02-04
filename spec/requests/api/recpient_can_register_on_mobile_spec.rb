RSpec.describe 'POST /api/auth', type: :request do
  let(:recipient) { create(:recipient) }
  let(:recipient_headers) { recipient.create_new_auth_token }

  describe 'with valid credentials' do
    before do
      post '/api/auth',
           params: {
             email: 'user_becomes@recipient.com',
             password: '123456',
             password_confirmation: '123456',
             role: 'recipient'
           },
           headers: headers
    end

    it 'returns a 200 response status' do
      expect(response).to have_http_status 200
    end

    it 'returns a success message' do
      expect(response_json['status']).to eq 'success'
    end
  end
end