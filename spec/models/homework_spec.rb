require 'rails_helper'

RSpec.describe Homework, type: :model do
  context 'validations' do
    it 'is valid with valid information' do
      expect(FactoryGirl.build(:homework)).to be_valid
    end
    it 'is not valid without a title' do
      expect(FactoryGirl.build(:homework, title: "")).not_to be_valid
    end
    it 'is not valid without a homework' do
      expect(FactoryGirl.build(:homework, due: "")).not_to be_valid
    end
    it 'is not valid without a question' do
      expect(FactoryGirl.build(:homework, question: "")).not_to be_valid
    end
  end
end
