Feature: Login
  As a user,
  I want to log into the application with my username and password
  so that I can access the application's features.

  @smoke @login
  Scenario: Log in with valid credentials
    When I am on login page
    And I login with correct credentials
    Then I am logged in