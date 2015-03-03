# Example: How do I find questions with no answers

## Two models:

* Question
* Answer

## With relationships:

* Question *has_many* Answers
* Answer *belongs_to* Question

## how to find empty relationships:

``` ruby
Question.includes(:answers).where(answers: {id: nil})
```

## how to find questions that have answers:

``` ruby
Question.includes(:answers).where.not(answers: {id: nil})
```

See `spec/models/question_spec.rb` for details.

# Development

This rails app is not intended for production. There is nothing
configured for production, and no production.rb in environments.

Also, the only features included are ActiveModel and ActiveRecord. No
mailers, views, jobs, controllers, sprockets, test_unit. RSpec is used
for running tests.

SQLite3 is adequate to show the relationships above and run the tests.

## Setup

```
$ bundle install
$ bundle binstub rspec-core
$ bin/rake db:setup # may need db:drop first if already installed
```

## Console

[Pry](http://pryrepl.org) is the console of choice!

## Tests

```
$ bin/rake
```

# Author

[Tamara Temple](http://about.me/tamouse) is a geeky girl, webologist
and software craft maven. I like to try things out, learn stuff, and
then try to help others learn, too. My dev blog is at
<http://swaac.tamouse.org> and I'm on [github](https://github.com) as
[tamouse](https://github.com/tamouse).
