Given /^I am on the home page$/ do
  visit "/"
end

Then /^I should see header links$/ do
  within first("div.navbar-fixed-top ul.nav") do
    page.should have_link('Home')
    page.should have_link('Organisations')
    page.should have_link('Sign out')
  end
end

Then /^I should see login form$/ do
  within ("#new_user") do
    expect(page).to have_selector("input[name='user[email]']")
    expect(page).to have_css("#user_email")
    expect(page).to have_selector("input[name='user[password]']")
    expect(page).to have_css("#user_password")
    expect(page).to have_selector("input[name='user[remember_me]']")
    expect(page).to have_css("#user_remember_me")
    expect(page).to have_button("Log in")
  end
  page.should have_link('Forgot your password?')
  page.should have_link('Sign up')
end
