RSpec.describe 'POST /api/auth', type: :request do
  let(:headers) { { HTTP_ACCEPT: 'application/json' } }

  describe 'with valid credentials' do
    before do
      post '/api/auth',
          params: {
            email: 'donor@donor.com',
            password: '123456',
            password_confirmation: '123456',
            role: 'donor'
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

  context 'when a user submits' do
    describe 'a non-matching password confirmation' do
      before do
        post '/api/auth',
            params: {
              email: 'donor@donor.com',
              password: '123456',
              password_confirmation: '12345678'
            },
            headers: headers
      end

      it 'returns a 422 response status' do
        expect(response).to have_http_status 422
      end

      it 'returns an error message' do
        expect(response_json['errors']['password_confirmation']).to eq ["doesn't match Password"]
      end
    end

    describe 'an invalid email address' do
      before do
        post '/api/auth',
            params: {
              email: 'randomuserrandomuser.com',
              password: '123456',
              password_confirmation: '123456'
            },
            headers: headers
      end

      it 'returns a 422 response status' do
        expect(response).to have_http_status 422
      end

      it 'returns an error message' do
        expect(response_json['errors']['email']).to eq ['is not an email']
      end
    end

    describe 'an already registered email' do
      let!(:registered_user) { create(:user, email: 'donor@donor.com') }

      before do
        post '/api/auth',
            params: {
              email: 'donor@donor.com',
              password: '123456',
              password_confirmation: '123456'
            },
            headers: headers
      end

      it 'returns a 422 response status' do
        expect(response).to have_http_status 422
      end

      it 'returns an error message' do
        expect(response_json['errors']['email']).to eq ['has already been taken']
      end
    end
  end
end