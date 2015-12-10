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
end
