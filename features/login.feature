Feature: Login Page

  Scenario: Success Login with correct credential
    Given I am on the homepage
    When  I click Sign In
    And I fill my credential
    Then I should be logged in

  Scenario: Fail Login with wrong email
    Given I am on the homepage
    When  I click Sign In
    And I fill wrong email
    Then I should be not logged in
    And I should see the error message
