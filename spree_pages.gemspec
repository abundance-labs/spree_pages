
lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift lib unless $LOAD_PATH.include?(lib)

require 'spree_pages/version'

Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_pages'
  s.version     = SpreePages.version
  s.summary     = 'Simple static pages for spree'
  s.required_ruby_version = '>= 2.2.7'

  s.author    = 'Kozaev Artem'
  s.email     = 'artem@publicmarket.io'
  s.homepage  = 'https://github.com/public-market'
  s.license = 'BSD-3-Clause'

  s.require_path = 'lib'
  s.requirements << 'none'

  spree_version = '>= 3.1.0', '< 4.0'
  s.add_dependency 'spree_backend', spree_version
  s.add_dependency 'spree_core', spree_version
  s.add_dependency 'spree_extension'

  s.add_development_dependency 'appraisal'
  s.add_development_dependency 'capybara'
  s.add_development_dependency 'coffee-rails'
  s.add_development_dependency 'database_cleaner'
  s.add_development_dependency 'factory_bot'
  s.add_development_dependency 'ffaker'
  s.add_development_dependency 'mysql2'
  s.add_development_dependency 'pg', '~> 0.18'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'sqlite3'
end
