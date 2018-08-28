module Spree
  module SpreePages
    class RoutesConstraints
      # rubocop:disable Metrics/LineLength
      def self.matches?(request)
        return false if request.path == '/' ||
                        request.path.starts_with?(Spree.admin_path) ||
                        request.path =~ %r{\A\/+(api|account|cart|checkout|content|login|pg\/|orders|products|s\/|session|signup|shipments|states|t\/|tax_categories|user)+}
        Spree::Page.find_by(slug: request.path[1..-1]).present?
      end
      # rubocop:enable Metrics/LineLength
    end
  end
end
