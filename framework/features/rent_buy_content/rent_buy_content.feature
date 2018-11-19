Feature: Rent/Buy content
  As a user,
  I want to rent/buy content

  Background:
    Given I am on login page
    And I login with correct credentials

  @smoke @content
  Scenario Outline: Buy content
    When I click on the movie
    And I click watch now button
    And I click <action>
    And I confirm
    Then I have the movie marked as <action> in my video store
    Examples:
      | action |
      | rent   |
      | buy    |