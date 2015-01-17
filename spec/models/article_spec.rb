require "rails_helper"

describe Article do

  before do
    @article = Article.new
  end
  
  it "should have many attachments" do
    t = Article.reflect_on_association(:attachments)
    t.macro.should == :has_many
  end
  
  it "should have many attachment_trackers" do
    t = Article.reflect_on_association(:attachment_trackers)
    t.macro.should == :has_many
  end
  
  it "should belongs to user" do
    t = Article.reflect_on_association(:user)
    t.macro.should == :belongs_to
  end
  
  it "should belongs to organisation" do
    t = Article.reflect_on_association(:organisation)
    t.macro.should == :belongs_to
  end
  
  it "must have required fields" do
    @article.valid?
    @article.errors[:user_id].should_not be_empty
    @article.errors[:organisation_id].should_not be_empty
    @article.errors[:title].should_not be_empty
    @article.errors[:body].should_not be_empty
  end
end

