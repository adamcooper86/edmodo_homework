require 'rails_helper'

RSpec.describe StudentsController, type: :controller do
  let(:student){ FactoryGirl.create :student }

  before(:each){
    session[:user_id] = student.id
  }

  describe 'GET #show' do
    subject{ get :show, id: student.id }

    it { is_expected.to be_success }
    # it { is_expected.to render_template "show" }
  end
end
