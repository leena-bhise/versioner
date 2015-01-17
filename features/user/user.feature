@javascript
Feature: User Sign in and Sign out
  Scenario: Create user account
    Given I am on the home page
     Then I click on sign up link
     And I fill sign up form and click on submit

  Scenario: Sign in user account
    Given I am on the home page
     Then I click on sign in link
     And I fill email and password and click on submit
