require "rails_helper"

RSpec.describe HomeController, :type => :controller do
  describe "GET #index" do
    it "should responds successfully" do
      get :index
      expect(response).to be_success
    end
  end
end
