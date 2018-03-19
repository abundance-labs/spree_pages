require 'spec_helper'

RSpec.describe 'Visits page', type: :feature do
  before { create(:store, default: true) }

  it 'corretcly loads page/' do
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
end
