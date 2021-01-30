RSpec.describe 'Api::UserController', type: :request do
  describe 'User can edit their profile page information ' do
    describe 'Successfully' do
      let(:user) { create(:user) }
      let(:user_credentials) { user.create_new_auth_token }
      let(:user_headers) { { HTTP_ACCEPT: 'application/json' }.merge!(user_credentials) }

      before do
        put "/api/user/#{user.id}",
            params: {
              company_name: 'Netto',
              adress: 'Bananvägen 258',
              zipcode: '45678',
              city: 'Kiruna'
            }, headers: user_headers
      end

      it 'returns a 200 response status' do
        expect(response).to have_http_status 200
      end

      it 'is expected to return updated company name' do
        expect(response_json['company_name']).to eq 'Netto'
      end
      it 'is expected to return updated adress' do
        expect(response_json['adress']).to eq 'Bananvägen 258'
      end
      it 'is expected to return updated zipcode' do
        expect(response_json['zipcode']).to eq '45678'
      end
      it 'is expected to return updated city' do
        expect(response_json['city']).to eq 'Kiruna'
      end

      describe 'Unsuccessfully' do
        describe 'Cannot update profile with wrong information' do
          before do
            put "/api/user/#{user.id}",
                params: {
                  company_name: '',
                  adress: '',
                  zipcode: '',
                  city: ''
                }, headers: user_headers
          end

          it 'is expected to respond 400' do
            expect(response).to have_http_status 400
          end
          it 'is expected to not be empty' do
            expect(response_json['company_name']).to_not eq ''
          end
          it 'is expected to not be empty' do
            expect(response_json['adress']).to_not eq ''
          end
          it 'is expected to not be empty' do
            expect(response_json['zipcode']).to_not eq ''
          end
          it 'is expected to not be empty' do
            expect(response_json['city']).to_not eq ''
          end
        end
      end
    end
  end
end
