Then /^I click on new article link$/ do
  within first("div.navbar-fixed-top ul.nav") do
    page.should have_link('Organisations')
    click_link "Organisations"
  end
  click_link "New Article"
end

Then /^I fill article form and click on create$/ do
  within ("#new_article") do
    fill_in "article_title", :with => 'Test Article 1'
    fill_in "article_body", :with => 'Test body'
    attach_file('article_attachments_attributes_0_image', File.join(Rails.root, 'features', 'upload-files', '213.jpg'))
    click_button "Create Article"
  end
  
  within ("div.alert-success") do
    page.should have_content("Successfully created article")
  end
  
  page.should have_content("Test Article 1")
  page.should have_content("Test body")
  page.should have_link("Edit")
  
end

Then /^I create a new article and update it with keep attachment$/ do
  within ("#new_article") do
    fill_in "article_title", :with => 'Test Article 1'
    fill_in "article_body", :with => 'Test body'
    attach_file('article_attachments_attributes_0_image', File.join(Rails.root, 'features', 'upload-files', '213.jpg'))
    click_button "Create Article"
  end
  
  within ("div.alert-success") do
    page.should have_content("Successfully created article")
  end
  
  page.should have_content("Test Article 1")
  page.should have_content("Test body")

  page.should have_link("Edit")
  click_link "Edit"
  
  fill_in "article_title", :with => 'Updated Test Article 1'
  fill_in "article_body", :with => 'Updated Test body'
  check 'preserved_attachments_'
  click_button "Update Article"
  
  within ("div.alert-success") do
    page.should have_content("Successfully updated article")
  end
  page.should have_content("Updated Test Article 1")
  page.should have_content("Updated Test body")
end

Then /^I create a new article and update it with change attachment$/ do
  within ("#new_article") do
    fill_in "article_title", :with => 'Test Article 1'
    fill_in "article_body", :with => 'Test body'
    attach_file('article_attachments_attributes_0_image', File.join(Rails.root, 'features', 'upload-files', '213.jpg'))
    click_button "Create Article"
  end
  
  within ("div.alert-success") do
    page.should have_content("Successfully created article")
  end
  
  page.should have_content("Test Article 1")
  page.should have_content("Test body")

  page.should have_link("Edit")
  click_link "Edit"
  attchment_link = page.find('a.thumbnail')[:href]
  visit attchment_link

  click_link('Edit')
  attach_file('attachment_image', File.join(Rails.root, 'features', 'upload-files', '123.jpg'))
  click_button("Update Attachment")
  page.should have_content("Version 1 of 1 ")
end
