Feature: Dashboard users
  In order to manage users
  As an authorized user
  I want to see the users list, edit page and destroy users

  Background:
    Given I am logged in as admin
    And the following users exist:
      | Username  |
      | user1     |
      | user2     |

  Scenario: List users
    Given I am on the dashboard users page
    And I should see "User"
    And I should see "User List"

  Scenario: Delete user
    Given I am on the dashboard users page
    When I follow "Destroy"
    Then I am on the dashboard users page

  Scenario: Edit existing user
    Given I am on the edit user registration page
    And I fill in "newpassword" for "user_password"
    And I fill in "newpassword" for "user_password_confirmation"
    And I fill in "password" for "user_current_password"
    Then I press "Submit"
    Then I am on the edit user registration page
