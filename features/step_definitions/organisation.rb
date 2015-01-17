Then /^I click on organisation link$/ do
  within first("div.navbar-fixed-top ul.nav") do
    page.should have_link('Organisations')
    click_link "Organisations"
  end
end

Then /^I click on create organisation button$/ do
  click_link "Create Organisation"
end

Then /^I fill organization form and click on create$/ do
  within ("#new_organisation") do
    fill_in "organisation_name", :with => 'Test Org'
    click_button "Create"
  end
  
  within ("div.alert-success") do
    page.should have_content("Organisation was successfully created")
  end

  within ("div.list-group") do
    page.should have_link("Test Org")
  end
end

Then /^I click on organisation and should see some existing organizations$/ do
  organisation = FactoryGirl.create(:organisation)
  within first("div.navbar-fixed-top ul.nav") do
    page.should have_link('Organisations')
    click_link "Organisations"
  end
  page.should have_link(organisation.name)
end


Then /^I click on organisation and see information for a organization without articles$/ do
  organisation = FactoryGirl.create(:organisation)
  within first("div.navbar-fixed-top ul.nav") do
    page.should have_link('Organisations')
    click_link "Organisations"
  end
  page.should have_link(organisation.name)
  click_link organisation.name
  
  page.should have_content(organisation.name)
  page.should have_content("No articles found for this organisation")
end

Then /^I click on organisation and see information for a organization with articles$/ do
  organisation = FactoryGirl.create(:organisation)
  article = FactoryGirl.create(:article, {:organisation_id => organisation.id})
  within first("div.navbar-fixed-top ul.nav") do
    page.should have_link('Organisations')
    click_link "Organisations"
  end
  page.should have_link(organisation.name)
  click_link organisation.name
  
  page.should have_content(organisation.name)
  page.should have_link(article.title)
  page.should have_content(article.body)
end
