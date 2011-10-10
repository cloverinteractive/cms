Feature: Dashboard pages
  In order to create, delete and edit pages
  As an authorized user
  I want to see the pages list, create, destroy and edit pages

  Background:
    Given I am logged in as admin
    And a section exists with a name of "Sample section"
    And a page exists with a name of "Sample page"

  Scenario: List pages
    Given I am on the dashboard pages page
    Then I should see "Page"
    And I should see "Pages List"

  Scenario: Edit current page
    Given I am on the dashboard pages page
    When I follow "Edit"
    Then I should see "Name"
    And I fill in "New page" for "Name"
    And I fill in "New page content" for "page_content"
    And I select "Sample section" from "Section"
    Then I press "Submit"
    Then I should see "Your record was successfully updated."

  Scenario: Create new page
    Given I am on the new dashboard page page
    Then I should see "Name"
    And I fill in "New page" for "Name"
    And I fill in "New page description" for "page_content"
    And I select "Sample section" from "Section"
    And I check "Home page"
    And I check "Published"
    Then I press "Submit"
    Then I should see "Your record was successfully created."
    And I am on the dashboard pages page

  Scenario: Destroy page
    Given I am on the dashboard pages page
    Then I follow "Destroy"
    Then I am on the dashboard pages page
