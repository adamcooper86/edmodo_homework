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

      context 'given invalid inputs' do
        let(:no_students){ {homework: homework} }
        let(:students_not_arrray){ {students: student, homework: homework} }
        let(:no_homework){ {students: [student]} }

        it 'Raises an arguement error if not provided with an array of students' do
          expect{teacher.assign_homework_to_students no_students}.to raise_error
          expect{teacher.assign_homework_to_students students_not_array}.to raise_error
        end
        it 'Raises an arguement error if not proveded a homework' do
          expect{teacher.assign_homework_to_students no_homework}.to raise_error
        end
      end
    end
  end
end
