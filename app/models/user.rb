class User < ActiveRecord::Base
  enum role: [:teacher, :student]

  validates :username, presence: true, uniqueness: true
  validates :role, presence: true

  has_many :teacher_assignments, class_name: 'Assignment', foreign_key: "teacher_id"
  has_many :student_assignments, class_name: 'Assignment', foreign_key: 'student_id'

  def assign_homework_to_students options
    homework = options.fetch :homework
    students = options.fetch :students

    students.map do |student|
      Assignment.create student_id: student.id, teacher_id: self.id, homework_id: homework.id
    end
  end
end
