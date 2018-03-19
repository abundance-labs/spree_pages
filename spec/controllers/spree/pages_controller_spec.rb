RSpec.describe Spree::PagesController, type: :controller do
  before do
    allow(controller).to receive(:spree_current_user).and_return(nil)
    allow(controller).to receive(:current_store).and_return(build_stubbed(:store))
  end

  describe '#show' do
    subject(:get_page) { get :show, params: { path: path } }

    let(:page) { create(:page) }

    context 'with page slug' do
      let(:path) { page.slug[1..-1] }

      it { is_expected.to be_success }

      it 'loads page' do
        get_page
        expect(assigns(:page)).to eq page
      end
    end
  end
end
