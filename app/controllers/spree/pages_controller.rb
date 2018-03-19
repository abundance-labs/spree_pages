module Spree
  class PagesController < StoreController
    def show
      @page = Spree::Page.find_by(slug: request.path[1..-1])
    end
  end
end
