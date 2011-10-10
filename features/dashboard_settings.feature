Feature: Dashboard settings
  In order to create, delete and edit settings
  As an authorized user
  I want to see the settings list, create, destroy and edit settings

  Background:
    Given I am logged in as admin
    And a setting exists with a name of "theme"

  Scenario: List settings
    Given I am on the dashboard settings page
    Then I should see "Setting"
    And I should see "Setting List"

  Scenario: Edit current setting
    Given I am on the dashboard settings page
    When I follow "Edit"
    Then I should see "Edit Setting"
    And I fill in "footer" for "Name"
    And I press "Submit"
    Then I should see "Your record was successfully updated."

  Scenario: Create new setting
    Given I am on the new dashboard setting page
    When I fill in "footer" for "Name"
    And I fill in "this is the value" for "Value"
    And I press "Submit"
    Then I should see "Your record was successfully created."

  Scenario: Delete existing setting
    When I am on the dashboard settings page
    And I follow "Destroy"
    Then I am on the dashboard settings page
