FactoryBot.define do

  factory :category do
    name "rails"
  end

  sequence :slug do |n|
    "slug#{n}"
  end

  factory :pin do
    title "Rails Cheatsheet"
    url "http://rails-cheat.com"
    text "A great tool for beginning developers"
    slug
    category
  end

  factory :user do
    sequence(:email) { |n| "coder#{n}@skillcrush.com" }
    first_name "Skillcrush"
    last_name "Coder"
    password "secret"

    after(:create) do |user|
#      create_list(:pin, 3) changed after repin ability added
      3.times do
        user.pinnings.create(pin: FactoryBot.create(:pin))
      end
    end
  end

  factory :pinning do
    pin
    user
  end

end
