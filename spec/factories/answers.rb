$answer_set = [
  "red, no blue",
  "42",
  "African or European?",
  "As you wish"
]

FactoryGirl.define do
  factory :answer do
    answer { $answer_set.sample(1) }
  end
end

