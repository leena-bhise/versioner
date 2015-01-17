require "rails_helper"

RSpec.describe OrganisationsController, :type => :controller do
  describe "GET #index" do
    it "should responds with new index" do
      get :index
      expect(response).to be_success
      expect(response).to render_template(:index)
    end
  end
  
  describe "GET #new" do
    it "should responds with new template" do
      get :new
      expect(response).to be_success
      expect(response).to render_template(:new)
    end
  end
  
  describe "POST #create" do
    it "should create organization with valid fields" do
      post :create, {:organisation => {:name => 'Test Org1', :description => 'Test Org 1 Description'}}
      flash[:notice].should eq("Organisation was successfully created")
      expect(response).to redirect_to(organisations_path)
    end
    
    it "should not create organization without name" do
      post :create, {:organisation => {:name => '', :description => 'Test Org 1 Description'}}
      flash[:notice].should eq(nil)
      assigns(:organisation).errors.present?.should eq(true)
      expect(response).to render_template(:new)
    end
  end
  
  describe "POST #show" do
    it "should show organization" do
      organisation = FactoryGirl.create(:organisation)
      get :show, {:id => organisation.id}
      expect(response).to be_success
      expect(response).to render_template(:show)
    end
  end
end
