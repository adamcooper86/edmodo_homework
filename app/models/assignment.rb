class Assignment < ActiveRecord::Base
  belongs_to :teacher, class_name: "User"
  belongs_to :student, class_name: "User"
  belongs_to :homework

  validates :teacher, :student, :homework, presence: true
end
