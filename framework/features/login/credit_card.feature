Feature: Credit Card adding
  As a user,
  I want to add a credit card
  Background:
    Given I am on login page
    And I login with correct credentials

  @smoke @login
  Scenario: Add MasterCard credit card
    When I am on add credit card page
    And I add MasterCard credit card