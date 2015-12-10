require 'rails_helper'

RSpec.describe Assignment, type: :model do
  context 'validations' do
    it 'is valid with valid information' do
      expect(FactoryGirl.build(:assignment)).to be_valid
    end
    it 'is not valid without a student' do
      expect(FactoryGirl.build(:assignment, student: nil)).not_to be_valid
    end
    it 'is not valid without a teacher' do
      expect(FactoryGirl.build(:assignment, teacher: nil)).not_to be_valid
    end
    it 'is not valid without a homework' do
      expect(FactoryGirl.build(:assignment, homework: nil)).not_to be_valid
    end
  end
  describe '.homeworks' do
    it 'returns an empty array if no assignments are provided' do
      expect(Assignment.homeworks_for []).to eq []
    end
    it 'returns an array of homeworks based on a collection of assignments' do
      assignment1 = FactoryGirl.create(:assignment)
      assignment2 = FactoryGirl.create(:assignment)
      assignments = [ assignment1, assignment2 ]
      homeworks = [ assignment1.homework, assignment2.homework ]

      expect(Assignment.homeworks_for assignments).to eq homeworks
    end
    it 'the homeworks are unique' do
      homework = FactoryGirl.create(:homework)
      assignment1 = FactoryGirl.create(:assignment, homework: homework)
      assignment2 = FactoryGirl.create(:assignment, homework: homework)
      assignments = [ assignment1, assignment2 ]
      homeworks = [ homework ]

      expect(Assignment.homeworks_for assignments).to eq homeworks
    end
  end
end
