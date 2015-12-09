class Homework < ActiveRecord::Base
  has_many :assignments
  has_many :students, through: :assignments
  has_many :teachers, through: :assignments

  validates :question, :title, :due, presence: true
end
