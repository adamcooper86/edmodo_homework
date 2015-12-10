require 'rails_helper'

feature "Teacher sees a list of lates submissions", js: false, focus: true do
  given!(:teacher){ FactoryGirl.create :teacher }
  given(:student){ FactoryGirl.create :student }

  background do
    3.times do
      FactoryGirl.create :homework
    end

    visit login_path
    within '.login_form' do
      fill_in 'username', with: teacher.username
    end
    click_on 'Log In'
  end

  scenario 'Teacher sees a list of homeworks' do
    expect(page).to have_content teacher.username
    expect(page).to have_selector '#homeworksList'
    expect(page).to have_selector '.homework'
    expect(page).to have_content Homework.last.title
  end
end