RSpec.describe Spree::Page, type: :model do
  let!(:page) { build_stubbed(:page) }

  describe 'factory' do
    it 'is valid' do
      expect(page).to be_valid
    end
  end

  describe '#remove_leading_slash_from_slug' do
    let(:page) { build(:page, slug: '/slash') }

    it 'adds slash to all slugs' do
      page.save
      expect(page.slug).to eq 'slash'
    end
  end
end
