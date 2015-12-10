require 'rails_helper'

feature "Teacher sees a list of lates submissions", js: false do
  given!(:teacher){ FactoryGirl.create :teacher }
  given(:student){ FactoryGirl.create :student }

  background do
    3.times do
      assignment = FactoryGirl.create :assignment, teacher: teacher
      FactoryGirl.create :submission, assignment: assignment, answer: "first answer"
      FactoryGirl.create :submission, assignment: assignment, answer: "second answer"
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
  scenario 'Teacher sees all of the latest_submissions' do
    expect(page).to have_content "second answer"
    expect(page).not_to have_content "first answer"
  end
  scenario 'Teacher can go to homework show page to see all submission versions' do
    first('.homework').click_link('See all')

    expect(page).to have_content "first answer"
    expect(page).to have_content "second answer"
  end
end