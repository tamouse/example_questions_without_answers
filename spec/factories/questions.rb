require 'faker'
FactoryGirl.define do
  factory :question do
    question { Faker::Lorem.sentence }

    # Taken straight from https://github.com/thoughtbot/factory_girl/blob/master/GETTING_STARTED.md
    factory :question_with_answers do
      transient do
        answer_count 3
      end

      after(:create) do |question, evaluator|
        create_list(:answer, evaluator.answer_count, question: question)
      end
    end
  end
end
