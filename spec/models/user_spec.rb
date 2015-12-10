require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Teacher' do
    let(:teacher){ FactoryGirl.create :teacher }
    let(:student){ FactoryGirl.create :student }
    let(:homework){ FactoryGirl.create :homework }

    context '#assign_homework_to_students' do
      subject{ teacher.assign_homework_to_students students: [student], homework: homework }

      it 'returns a collection of assignments' do
        expect(subject[0]).to be_a Assignment
      end

      it 'should create assignment record' do
        expect{subject}.to change{Assignment.all.count}.by 1
      end
    end
  end
end
