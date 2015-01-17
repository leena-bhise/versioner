require "rails_helper"

describe Organisation do

  before do
    @organisation = Organisation.new
  end
  
  it "should have many users" do
    t = Organisation.reflect_on_association(:users)
    t.macro.should == :has_many
  end
  
  it "should have many articles" do
    t = Organisation.reflect_on_association(:articles)
    t.macro.should == :has_many
  end
  
  it "must have a name" do
    @organisation.valid?
    @organisation.errors[:name].should_not be_empty
  end
end

