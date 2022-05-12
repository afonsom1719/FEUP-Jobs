Feature: Show all job listings at FEUP's job bank

    Scenario: Authenticated User consults all job listings at FEUP's job bank
    When I tap the "feupsjobbank" button
    And I fill the "usernameinput" field with "up200012345"
    And  I fill the "passwordinput" field with "1234"
    And I tap the "login" button
    Then I expect the text "FEUP's Job Bank" to be present