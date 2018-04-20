FactoryBot.define do
  factory :page, class: Spree::Page do
    title { generate(:random_string) }
    content { generate(:random_description) }

    meta_title { generate(:random_string) }
    meta_description { generate(:random_string) }

    sequence(:slug) { |n| "page#{n}" }

    trait :with_image do
      meta_image { File.new(Spree::Core::Engine.root + 'spec/fixtures' + 'thinking-cat.jpg') }
    end
  end
end
