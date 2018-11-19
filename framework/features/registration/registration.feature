Feature: Registration
  As a user,
  I want to register to the app

  @smoke @registration
  Scenario: Sign Up with valid credentials
    When I am on registration page
    And I sign up with correct credentials
    Then I am registered