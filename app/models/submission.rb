class Submission < ActiveRecord::Base
  belongs_to :assignment
  validates :assignment, presence: true

  def student
    self.assignment.student
  end
end
