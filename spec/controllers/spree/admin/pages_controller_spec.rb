RSpec.describe Spree::Admin::PagesController, type: :controller do
  stub_authorization!

  routes { Spree::Core::Engine.routes }

  describe '#update' do
    subject(:update_page) { put :update, params: { id: page.id, page: { title: new_page_title }} }

    let(:new_page_title) { 'New page title' }
    let(:page) { create(:page, title: 'Old page title') }

    it 'updates page' do
      expect {
        update_page
      }.to change { page.reload.title }.to new_page_title
    end
  end
end
