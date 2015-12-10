class User < ActiveRecord::Base
  enum role: [:teacher, :student]

  validates :username, presence: true, uniqueness: true
  validates :role, presence: true

  has_many :teacher_assignments, class_name: 'Assignment', foreign_key: "teacher_id"
  has_many :student_assignments, class_name: 'Assignment', foreign_key: 'student_id'

  def assign_homework_to_students options
    homework = options.fetch :homework, nil
    students = options.fetch :students, nil

    students.is_a?(Array) ? create_assignments(students, homework) : raise(ArgumentError, ':students arguement is not a valid input')
  end

private
  def create_assignments students, homework
    students.map do |student|
      create_assignment student.id, homework.id, self.id
    end
  end
  def create_assignment student_id, homework_id, teacher_id
    Assignment.create student_id: student_id, teacher_id: teacher_id, homework_id: homework_id
  end
end
