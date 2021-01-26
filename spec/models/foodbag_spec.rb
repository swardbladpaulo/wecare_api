RSpec.describe Foodbag, type: :model do
  describe 'is expected to have db columns' do
    it { is_expected.to have_db_column :id}
  end


end
