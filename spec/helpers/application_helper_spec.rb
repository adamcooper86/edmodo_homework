require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  let(:assignment){ FactoryGirl.create :assignment }

  context "#new_submission_path" do
    it "returns a correctly formated path" do
      expect(helper.new_submission_path assignment).to eq("/submissions/new?assignment_id=#{assignment.id}")
    end
  end
end
