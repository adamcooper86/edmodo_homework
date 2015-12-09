require 'rails_helper'

RSpec.describe WelcomeController, type: :controller do
  let(:teacher) {FactoryGirl.create(:teacher)}
  let(:valid_session) {{user_id: teacher.id}}

  describe "GET #index" do
    it "redirects to login page if user is not logged in" do
      get :index
      expect(response).to redirect_to login_url
    end

    it "returns http success if user is logged in" do
      get :index, {}, valid_session
      expect(response).to have_http_status(:success)
    end
  end

end
