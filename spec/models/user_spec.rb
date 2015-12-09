require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Teacher' do
    let(:teacher){ FactoryGirl.create :teacher }

    context '#assign_homework_to_students' do
      it 'exists' do
        expect(teacher.assign_homework_to_students).to be_truthy
      end
    end
  end
end
