RSpec.describe Foodbag, type: :model do
  describe 'is expected to have db columns' do
    it { is_expected.to have_db_column :id }
    it { is_expected.to have_db_column :pickuptime }
    it { is_expected.to have_db_column :status }
    it { is_expected.to have_db_column :donor_id }
  end

  describe 'is expected to have validation' do
    it { is_expected.to validate_presence_of :pickuptime }
    it { is_expected.to validate_presence_of :status }
  end

  describe 'Factory' do
    it 'is expected to be valid' do
      expect(create(:foodbag)).to be_valid
    end
  end
end
