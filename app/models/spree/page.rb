module Spree
  class Page < ApplicationRecord
    validates :title, :slug, :content, presence: true
    validates :slug, uniqueness: true

    before_save :prefix_slug_with_slash

    def prefix_slug_with_slash
      slug.prepend('/') unless slug.start_with?('/') # ensure that all slugs start with a slash
    end
  end
end
