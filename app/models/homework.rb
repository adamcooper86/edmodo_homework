class Homework < ActiveRecord::Base
  validates :question, :title, :due, presence: true
end
