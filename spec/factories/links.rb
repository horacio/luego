FactoryGirl.define do
  factory :link do
    sequence :url do |n|
      "https://www.site_#{n}.com"
    end
  end
end
