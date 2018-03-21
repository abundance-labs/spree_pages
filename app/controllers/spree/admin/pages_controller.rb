module Spree
  module Admin
    class PagesController < ResourceController
      private

      def permitted_resource_params
        params.require(:page).permit(%i[id title content slug meta_title meta_description meta_image live])
      end
    end
  end
end
