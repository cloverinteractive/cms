Feature: Dashboard section
  In order to create, delete and edit sections
  As an authorized user
  I want to see the sections list, create, destroy and edit sections

  Background:
    Given I am logged in as admin
    And a section exists with a name of "Sample section"

  Scenario: List sections
    Given I am on the dashboard sections page
    Then I should see "Section"
    And I should see "Section List"

  Scenario: Edit current section
    Given I am on the dashboard sections page
    When I follow "Edit"
    Then I should see "Edit Section"
    And I fill in "New name" for "Section"
    Then I press "Submit"
    Then I should see "Your record was successfully updated."

  Scenario: Create new section
    When I am on the new dashboard section page
    Then I fill in "New section" for "Section"
    And I press "Submit"
    Then I should see "Your record was successfully created."

  Scenario: Delete existing section
    When I am on the dashboard sections page
    And I follow "Destroy"
    Then I am on the dashboard sections page
