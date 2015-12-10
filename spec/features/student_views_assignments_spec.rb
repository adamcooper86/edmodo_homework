require 'rails_helper'

feature "Student Panel shows assignments", js: false do
  given!(:student){ FactoryGirl.create :student }

  background do
    3.times do
      FactoryGirl.create :assignment, student: student
    end

    visit login_path
    within '.login_form' do
      fill_in 'username', with: student.username
    end
    click_on 'Log In'
  end

  scenario 'Student sees a list of assignments' do
    expect(page).to have_content student.username
  end
end