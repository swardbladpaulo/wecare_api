RSpec.describe 'Sucessfully', type: :request do 
  describe 'User can view profie page'
  let(:user) { create (:user)}
  let(:user_credentials) { user.create_new_auth_token} 
  let(:user_headers) { { HTTP_ACCEPT: 'application/json'}.merge!(user_credentials) }

  before do 
    get "/api/profiles/#{user.id}",
    headers: user_headers
  end 


  it 'is expected to return a 201' do
    expect(response).to have_http_status 201
  end 
  it'is expected to return a success message' do
    expect(response_json['message']).to eq 'You profile has been created'
  end 

  it 'is expected to return donors company name' do 
    expect(response_json['donor']['company_name']).to eq 'Netto'
  end
  it 'is expected to return donors adress' do 
    expect(response_json['donor']['adress']).to eq 'Mangovägen 22'
  end
  it 'is expected to return donors zipcode' do 
    expect(response_json['donor']['zipcode']).to eq '41522'
  end
  it 'is expected to return donors city' do 
    expect(response_json['donor']['city']).to eq 'Kiruna'
  end

end
  
 

 

  
