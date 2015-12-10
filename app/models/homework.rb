class Homework < ActiveRecord::Base
  has_many :assignments
  has_many :students, through: :assignments
  has_many :teachers, through: :assignments

  validates :question, :title, :due, presence: true

  def submissions
    #creates a flat non-nested array of unique submission objects
    self.assignments.map{|assignment| assignment.submissions }.flatten.uniq
  end
end
