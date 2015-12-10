require 'rails_helper'

RSpec.describe SubmissionsController, type: :controller do
  let(:student){ FactoryGirl.create :student }
  let(:assignment){ FactoryGirl.create :assignment, student: student }

  before(:each){
    session[:user_id] = student.id
  }

  describe 'GET #new' do
    subject{ get :new, assignment_id: assignment.id }

    it { is_expected.to be_success }
    it { is_expected.to render_template "new" }
  end
  describe 'POST #create' do
    context 'A not late valid submission' do
      subject{ post :create, assignment_id: assignment.id }

      it { is_expected.to have_http_status 302 }
      it { is_expected.to redirect_to homework_path assignment.homework }
    end
    context 'Trying to post after the submission deadline' do
      let(:homework){ FactoryGirl.create :homework, due: Date.today - 1 }
      let(:assignment){ FactoryGirl.create :assignment, homework: homework }

      subject{ post :create, assignment_id: assignment.id }

      it { is_expected.to have_http_status 302 }
      it { is_expected.to redirect_to homework_path assignment.homework }
      it 'has a flash message telling them it was not submitted' do
        subject
        expect(flash[:notice]).to eq "Submission not created - passed submission deadline"
      end
    end
  end
end
