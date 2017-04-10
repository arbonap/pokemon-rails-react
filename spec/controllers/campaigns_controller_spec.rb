require 'rails_helper'

RSpec.describe CampaignsController, type: :controller do
  describe "GET #index" do
    it "has a 200 status code" do
      get :index
      expect(response.status).to eq(200)
    end

    it "renders the :index view" do
      get :index
      response.should render_template :index
    end
  end

  describe "GET /api_search" do
    it "returns http success for an AJAX request" do
      xhr :get, :api_search
      expect(response).to be_ok
    end
  end
end
