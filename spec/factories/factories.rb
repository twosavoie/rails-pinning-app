FactoryBot.define do

  factory :category do
    name "rails"
  end

  sequence :slug do |n|
    "slug#{n}"
  end

  factory :pinning do
    pin
    user
  end

  factory :board do
    name "My Pins!"
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

  factory :user_with_boards do
    after(:create) do |user|
      user.boards << FactoryBot.create(:board)
      3.times do
        user.pinnings.create(pin: FactoryBot.create(:pin), board: user.boards.first)
      end
    end

  factory :user_with_boards_and_followers do
    after(:create) do |user|
      3.times do
        follower = FactoryBot.create(:user)
        Follower.create(user: user, follower_id: follower.id)
      end
    end
  end 
end

  factory :user_with_followees do
    after(:create) do |user|
      3.times do
        Follower.create(user: FactoryBot.create(:user), follower_id: user.id)
      end
    end
  end
end
end
