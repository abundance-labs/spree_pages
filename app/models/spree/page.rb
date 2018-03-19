module Spree
  class Page < ApplicationRecord
    validates :title, :slug, :content, presence: true
    validates :slug, uniqueness: true

    before_save :remove_leading_slash_from_slug

    def remove_leading_slash_from_slug
      self.slug = slug[1..-1] if slug.start_with?('/') # ensure that slugs don't start with a slash
    end
  end
end
