# Example: How do I find questions with no answers

Two models:

* Question
* Answer

* Question *has_many* Answers
* Answer *belongs_to* Question

## how to find empty relationships

``` ruby
Question.includes(:answers).where(answers: {id: nil})
```

## how to find questions that have answers

``` ruby
Question.includes(:answers).where.not(answers: {id: nil})
```

See `spec/models/question_spec.rb` for details.


