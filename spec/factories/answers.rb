require 'faker'
FactoryGirl.define do
  factory :answer do
    answer { Faker::Lorem.sentence }
  end
end

