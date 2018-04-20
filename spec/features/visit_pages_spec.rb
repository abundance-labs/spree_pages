require 'spec_helper'

RSpec.describe 'Visits page', type: :feature do
  before { allow(Spree::Store).to receive(:default) { build_stubbed(:store) } }

  it 'correctly loads page' do
    spree_page = create(:page, slug: 'page')
    visit '/page'
    expect(page).to have_text spree_page.title
  end

  it 'can have slug with multiple /' do
    spree_page = create(:page, slug: 'page/with/slashes')
    visit '/page/with/slashes'
    expect(page).to have_text spree_page.title
  end

  it 'do not effect the rendering of the rest of the site' do
    product = create(:product)
    visit spree.product_path(product)
    expect(page).to have_text product.name
  end

  describe 'meta tags' do
    let(:spree_page) { create(:page) }

    before { visit spree.page_path(spree_page.slug) }

    it 'includes meta name' do
      expect(page).to have_css("meta[property='og:title'][content='#{spree_page.meta_title}']", visible: false)
    end

    it 'includes meta description' do
      expect(page).to have_css("meta[property='og:description'][content='#{spree_page.meta_description}']", visible: false)
    end

    describe 'image' do
      context 'without meta image' do
        it 'does not include meta image' do
          expect(page).not_to have_css("meta[property='og:image']", visible: false)
        end
      end

      context 'with meta image' do
        let(:spree_page) { create(:page, :with_image) }

        it 'includes meta image' do
          expect(page).to have_css("meta[property='og:image'][content='#{spree_page.meta_image.url(:large)}']", visible: false)
        end
      end
    end
  end
end
