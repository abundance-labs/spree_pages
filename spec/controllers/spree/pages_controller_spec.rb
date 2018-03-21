RSpec.describe Spree::PagesController, type: :controller do
  before do
    allow(controller).to receive(:spree_current_user).and_return(nil)
    allow(controller).to receive(:current_store).and_return(build_stubbed(:store))
  end

  describe '#show' do
    subject(:get_page) { get :show, params: { path: path } }

    let(:page) { create(:page) }
    let(:path) { page.slug }

    context 'with page slug' do
      it { is_expected.to be_success }

      it 'loads page' do
        get_page
        expect(assigns(:page)).to eq page
      end
    end

    context 'when page is not live' do
      let(:page) { create(:page, live: false) }

      context 'when user is not admin' do
        it { expect { get_page }.to raise_exception(ActiveRecord::RecordNotFound) }
      end

      context 'when user is admin' do
        before do
          user = build_stubbed(:user)
          allow(user).to receive(:has_spree_role?).with(:admin) { true }
          allow(controller).to receive(:spree_current_user).and_return(user)
        end

        it { expect { get_page }.not_to raise_exception }
      end
    end
  end
end
