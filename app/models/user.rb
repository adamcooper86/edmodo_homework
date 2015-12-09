class User < ActiveRecord::Base
  enum role: [:teacher, :student]

  validates :username, presence: true, uniqueness: true
  validates :role, presence: true

  has_many :teacher_assignments, class_name: 'Assignment', foreign_key: "teacher_id"
  has_many :student_assignments, class_name: 'Assignment', foreign_key: 'student_id'
end
