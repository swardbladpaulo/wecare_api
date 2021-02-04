RSpec.describe User, type: :model do
  describe 'Factory Bot' do
    it 'is expected to have a valid user factory bot' do
      expect(create(:user)).to be_valid
    end
    it 'is expected to have a valid user factory bot' do
      expect(create(:user, email: 'user_becomes@donor.com')).to be_valid
    end
    it 'is expected to have a valid recipient factory bot' do
      expect(create(:recipient, email: 'user_becomes@recipient.com')).to be_valid
    end

  end
  describe 'is expected to have db colums' do
    it { is_expected.to have_db_column :encrypted_password }
    it { is_expected.to have_db_column :email }
    it { is_expected.to have_db_column :tokens }
    it { is_expected.to have_db_column :role }
    it { is_expected.to have_db_column :adress }
    it { is_expected.to have_db_column :name }
    it { is_expected.to have_db_column :zipcode }
    it { is_expected.to have_db_column :city }
  end
  describe 'is expected to have validation' do
    it { is_expected.to validate_presence_of :email }
    it { is_expected.to validate_confirmation_of :password }
  end
end
