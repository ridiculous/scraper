require 'rails_helper'

RSpec.describe HomeController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it 'assigns all businesses to @businesses' do
      expect {
        get :index
      }.to change { assigns(:businesses) }.from(nil).to(Business.all)
    end
  end

end
