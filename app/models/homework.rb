class Homework < ActiveRecord::Base
  has_many :assignments
  has_many :students, through: :assignments
  has_many :teachers, through: :assignments

  validates :question, :title, :due, presence: true

  def submissions assignments = self.assignments
    #creates a flat non-nested array of unique submission objects
    assignments.map{|assignment| assignment.submissions }.flatten.uniq
  end

  def last_submissions
    self.assignments.map{|assignment| assignment.submissions.last }.flatten
  end

  def student_submissions student
    student_assignments = self.assignments.where(student_id: student.id)
    self.submissions student_assignments
  end
end
