class Submission < ActiveRecord::Base
  belongs_to :homework
  validates :homework, presence: true
end
