require 'rails_helper'

feature "Student Panel shows assignments", js: false do
  given!(:student){ FactoryGirl.create :student }

  context 'With open assignments' do
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
      expect(page).to have_selector '#assignmentsList'
      expect(page).to have_selector '.assignment'
      expect(page).to have_content Assignment.last.homework.title
      expect(page).to have_content Assignment.last.homework.question
      expect(page).to have_content Assignment.last.homework.due
    end
    scenario 'Student can create a new submission' do
      first('.assignment').click_link('Answer')

      expect(page).to have_selector '.new_submission'

      within '.new_submission' do
        fill_in 'submission_answer', with: 'Answer to homework'
      end
      click_on 'Submit'

      expect(page).to have_selector '#submissionInfo'
    end
  end
  context 'without open assignments' do
    background do
      3.times do
        time = Date.today - 1
        homework = FactoryGirl.create :homework, due: time
        FactoryGirl.create :assignment, student: student, homework: homework
      end

      visit login_path
      within '.login_form' do
        fill_in 'username', with: student.username
      end
      click_on 'Log In'
    end

    scenario 'Student sees a list of assignments' do
      expect(page).to have_content student.username
      expect(page).to have_selector '#assignmentsList'
      expect(page).to have_selector '.assignment'
      expect(first('.assignment')).not_to have_content 'Answer'
    end
  end
end