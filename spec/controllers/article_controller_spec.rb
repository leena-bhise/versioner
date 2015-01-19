require "rails_helper"
include Devise::TestHelpers

RSpec.describe ArticlesController, :type => :controller do
  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    @user = FactoryGirl.create(:user)
    sign_in @user
  end
    
  describe "GET #new" do
    it "should responds with new template" do
      organisation = FactoryGirl.create(:organisation)
      get :new, {:organisation_id => organisation.id}
      expect(response).to be_success
      expect(response).to render_template(:new)
      expect(assigns(:article).attachments).present?.should eq(true)
    end
  end
  
  describe "POST #create" do
    it "should create article with valid fields" do
      organisation = FactoryGirl.create(:organisation)
      post :create, {:organisation_id => organisation.id, :article => {:title => 'Test Art1', :body => 'Test Art 1 body', :organisation_id => organisation.id }}
      expect(assigns[:article]).present?.should eq(true)
      expect(assigns[:article].organisation).present?.should eq(true)
      expect(assigns[:article].attachment_trackers).present?.should eq(true)
      flash[:notice].should eq("Successfully created article")
      expect(response).to redirect_to(organisation_article_path(assigns[:article].organisation, assigns[:article]))
    end
    
    it "should not create article without required fields" do
      organisation = FactoryGirl.create(:organisation)
      post :create, {:organisation_id => organisation.id, :article => {:title => '', :body => '', :organisation_id => organisation.id }}
      flash[:notice].should eq(nil)
      assigns(:article).errors.present?.should eq(true)
      expect(response).to render_template(:new)
    end
  end
  
  describe "GET #edit" do
    it "should responds with edit template" do
      organisation = FactoryGirl.create(:organisation_with_article)
      article = organisation.articles.first
      get :edit, {:organisation_id => organisation.id, :id => article.id}
      expect(response).to be_success
      expect(response).to render_template(:edit)
    end
  end
  
  describe "PUT #update" do
    it "should update article with valid fields" do
      organisation = FactoryGirl.create(:organisation_with_article)
      article = organisation.articles.first
      article.title.should eq("Test Article title for organization")
      article.body.should eq("Test Article body for organization")
      put :update, {:organisation_id => organisation.id, :id => article.id, :article => {:title => 'Test Art updated', :body => 'Test Art body updated', :organisation_id => organisation.id }}
      assigns[:article].title.should eq("Test Art updated")
      assigns[:article].body.should eq("Test Art body updated")
      flash[:notice].should eq("Successfully updated article")
    end
    
    it "should not update article without required fields" do
      organisation = FactoryGirl.create(:organisation_with_article)
      article = organisation.articles.first
      article.title.should eq("Test Article title for organization")
      article.body.should eq("Test Article body for organization")
      put :update, {:organisation_id => organisation.id, :id => article.id, :article => {:title => '', :body => '', :organisation_id => organisation.id }}
      assigns(:article).errors.present?.should eq(true)
      expect(response).to render_template(:edit)
    end
  end
  
  describe "GET #show" do
    it "should responds with edit template" do
      organisation = FactoryGirl.create(:organisation_with_article)
      article = organisation.articles.first
      get :edit, {:organisation_id => organisation.id, :id => article.id}
      expect(response).to be_success
    end
  end
end
