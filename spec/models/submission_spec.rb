require 'rails_helper'

RSpec.describe Submission, type: :model do
  context 'validations' do
    it 'is valid with valid information' do
      expect(FactoryGirl.build(:submission)).to be_valid
    end
    it 'is not valid without a homework' do
      expect(FactoryGirl.build(:submission, homework: nil)).not_to be_valid
    end
  end
end
