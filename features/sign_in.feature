Feature: Autentication
  In order to manage my website
  As an authorized user
  I want to first sign into the dashboard

  Background:
    Given an admin exists

  Scenario: Sign in
    Given I am on the signin page
    When I fill in "admin" for "Username or Email"
    And I fill in "password" for "Password"
    And I press "Sign in"
    Then I should see "Edit User"
