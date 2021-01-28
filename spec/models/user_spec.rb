RSpec.describe User, type: :model do
  describe 'Factory Bot' do
    it 'is expected to have a valid user factory bot' do
      expect(create(:user)).to be_valid
    end
    it 'is expected to have a valid user factory bot' do
      expect(create(:user, email: 'donor@donor.com')).to be_valid
    end
  end
  describe 'is expected to have db colums' do
    it { is_expected.to have_db_column :encrypted_password }
    it { is_expected.to have_db_column :email }
    it { is_expected.to have_db_column :tokens }
    it { is_expected.to have_db_column :role}
  end
  describe 'is expected to have validation' do
    it { is_expected.to validate_presence_of :email }
    it { is_expected.to validate_confirmation_of :password }
  end
end
