@javascript
Feature: Organisation
  Scenario: Add new organisation
    Given I am on the home page
     Then I click on organisation link
     Then I click on create organisation button
     And I fill organization form and click on create

  Scenario: List existing organisation
    Given I am on the home page
     Then I click on organisation and should see some existing organizations
     
  Scenario: View existing organisation without articles
    Given I am on the home page
     Then I click on organisation and see information for a organization without articles
     
  Scenario: View existing organisation with articles
    Given I am on the home page
     Then I click on organisation and see information for a organization with articles
