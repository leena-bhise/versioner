Then /^I click on sign up link$/ do
  within first("div.navbar-fixed-top ul.nav") do
    page.should have_link('Sign in')
    click_link "Sign in"
  end
  page.should have_link('Sign up')
  click_link "Sign up"
end

Then /^I fill sign up form and click on submit$/ do
  within ("#new_user") do
    fill_in "user_name", :with => 'Test Name'
    fill_in "user_email", :with => 'test@gmail.com'
    fill_in "user_password", :with => '123456789'
    fill_in "user_password_confirmation", :with => '123456789'
    click_button "Sign up"
  end
  
  within ("div.alert-success") do
    page.should have_content("Close Welcome! You have signed up successfully.")
  end
  page.should have_content("Hello Test Name")
end

Then /^I click on sign in link$/ do
  within first("div.navbar-fixed-top ul.nav") do
    page.should have_link('Sign in')
    click_link "Sign in"
  end
end

Then /^I fill email and password and click on submit$/ do
  user = FactoryGirl.create(:user)
  organisation = FactoryGirl.create(:organisation)
  article = FactoryGirl.create(:article, :organisation_id => organisation.id, :user_id => user.id)
  within ("#new_user") do
    fill_in "user_email", :with => user.email
    fill_in "user_password", :with => user.password
    click_button "Log in"
  end
  
  within ("div.alert-success") do
    page.should have_content("Close Signed in successfully.")
  end
  page.should have_content("Hello " + user.name)
end
