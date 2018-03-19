FactoryBot.define do
  factory :page, class: Spree::Page do
    title { generate(:random_string) }
    content { generate(:random_description) }

    sequence(:slug) { |n| "page#{n}" }
  end
end
