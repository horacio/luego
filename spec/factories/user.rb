FactoryGirl.define do
  factory :user do
    email
    username
    password_digest 'password'
  end

  sequence :email do |n|
    "user_#{n}@example.com"
  end

  sequence :username do |n|
    "username_#{n}"
  end
end
