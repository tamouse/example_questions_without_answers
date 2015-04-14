# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  question   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Question < ActiveRecord::Base
  has_many :answers, dependent: :destroy

  scope :with_no_answers, ->{
    includes(:answers).where(answers: {id: nil})
  }

  scope :with_answers, ->{
    includes(:answers).where.not(answers: {id: nil})
  }

end
