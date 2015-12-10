require 'rails_helper'

RSpec.describe HomeworksController, type: :controller do
  let(:student){ FactoryGirl.create :student }
  let(:homework){ FactoryGirl.create :homework }

  before(:each){
    session[:user_id] = student.id
  }

  describe 'GET #edit' do
    subject{ get :edit, student_id: student.id, id: homework.id }

    it { is_expected.to be_success }
    it { is_expected.to render_template "edit" }
  end
  describe 'GET #show' do
    subject{ get :show, id: homework.id }

    it { is_expected.to be_success }
    it { is_expected.to render_template 'show' }
  end
end
