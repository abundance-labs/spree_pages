RSpec.describe Spree::Page, type: :model do
  let!(:page) { build_stubbed(:page) }

  describe 'factory' do
    it 'is valid' do
      expect(page).to be_valid
    end
  end
end
