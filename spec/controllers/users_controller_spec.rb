require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:student){ FactoryGirl.create :student }
  let(:teacher){ FactoryGirl.create :teacher }

  context 'A student user' do
    before(:each){
      session[:user_id] = student.id
    }

    describe 'GET #show' do
      subject{ get :show, id: student.id }

      it { is_expected.to be_success }
      it { is_expected.to render_template "show" }
    end
  end
  context 'A teacher user' do
    before(:each){
      session[:user_id] = teacher.id
    }

    describe 'GET #show' do
      subject{ get :show, id: teacher.id }

      it { is_expected.to be_success }
      it { is_expected.to render_template "show" }
    end
  end
end
