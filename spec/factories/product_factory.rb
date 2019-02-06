FactoryBot.define do
    sequence(:name) { |n| "productname#{n}" }

    factory :product do
        name
        description "desc"
        price 1000
        image_url "placeholder.jpg"
        color "testcolor"
    end
end
