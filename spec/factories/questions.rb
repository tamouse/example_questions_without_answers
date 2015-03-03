$question_set = [
  "Do you wanna build a snowman?",
  "What is your favourite colour?",
  "What is the meaning of life, the universe, and everything?",
  "What is the airspeed velocity of the unladen swallow?"
]

FactoryGirl.define do
  factory :question do
    question { $question_set.sample(1) }

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
