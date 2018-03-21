module Spree
  class Page < ApplicationRecord
    has_attached_file :meta_image, styles: ->(i) { i.instance.class.meta_image_sizes }
    validates_attachment_content_type :meta_image, content_type: %r{\Aimage\/.*\z}

    validates :title, :slug, :content, presence: true
    validates :slug, uniqueness: true

    before_save :remove_leading_slash_from_slug

    def remove_leading_slash_from_slug
      self.slug = slug[1..-1] if slug.start_with?('/') # ensure that slugs don't start with a slash
    end

    def self.meta_image_sizes
      { large: '1200x630>', medium: '600x315>', small: '200x200>' }
    end

    def self.meta_image_sizes_tags
      meta_image_sizes.map { |style, sizes| [style, { width: sizes.split('x')[0], height: sizes.split('x')[1].tr('>', '') }] }.to_h
    end
  end
end
