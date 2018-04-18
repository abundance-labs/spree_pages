require 'simplecov'

SimpleCov.start(:rails) do
  add_filter('spec/dummy')
  add_filter('lib/generators')
  add_filter('lib/spree_pages/engine')
  add_filter('lib/spree_pages/version')
end
