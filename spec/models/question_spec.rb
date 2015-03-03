# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  question   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Question, type: :model do
  before(:all) do
    Question.destroy_all
    FactoryGirl.create_list(:question_with_answers, 2)
    FactoryGirl.create(:question)
  end

  it "finds 2 questions with answers" do
    with_answers = Question.includes(:answers).where.not(answers: { id: nil}).load
    expect(with_answers.count).to eq(2),
    "Expected 2 questions, got: #{with_answers.count}\n#{with_answers.map(&:id)}"
  end

  it "finds 1 question without answers" do
    without_answers = Question.includes(:answers).where(answers: { id: nil}).load
    expect(without_answers.count).to eq(1),
    "Expected 1 question, got: #{without_answers.count}\n#{without_answers.map(&:id)}"
  end

end
