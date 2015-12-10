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
    subject{ post :create, assignment_id: assignment.id }

    it { is_expected.to have_http_status 302 }
    it { is_expected.to redirect_to homework_path assignment.homework }
  end
end
