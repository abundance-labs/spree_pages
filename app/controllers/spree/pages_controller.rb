module Spree
  class PagesController < StoreController
    def show
      @page =
        if try_spree_current_user&.respond_to?(:has_spree_role?) && try_spree_current_user&.has_spree_role?(:admin)
          Spree::Page.find_by(slug: request.path[1..-1])
        else
          Spree::Page.live.find_by!(slug: request.path[1..-1])
        end

      @title = @page.title
    end
  end
end
