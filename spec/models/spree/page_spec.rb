RSpec.describe Spree::Page, type: :model do
  let!(:page) { build_stubbed(:page) }

  describe 'factory' do
    it 'is valid' do
      expect(page).to be_valid
    end
  end

  describe '#prefix_slug_with_slash' do
    let(:page) { build(:page) }

    it 'adds slash to all slugs' do
      page.slug = 'noslash'
      page.save
      expect(page.slug).to eq '/noslash'
    end
  end
end
