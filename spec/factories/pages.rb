FactoryGirl.define do
  factory :page do
    sequence :url do |n|
      "https://www.site_#{n}.com"
    end
  end
end
