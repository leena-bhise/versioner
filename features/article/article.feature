@javascript
Feature: Article
  Scenario: Add new article
    Given I am on the home page
     Then I click on sign in link
     And I fill email and password and click on submit
     Then I click on new article link
     And I fill article form and click on create
     
  Scenario: Update article with attachment keep
    Given I am on the home page
     Then I click on sign in link
     And I fill email and password and click on submit
     Then I click on new article link
     And I create a new article and update it with keep attachment
     
  Scenario: Update article with attachment change
    Given I am on the home page
     Then I click on sign in link
     And I fill email and password and click on submit
     Then I click on new article link
     And I create a new article and update it with change attachment
