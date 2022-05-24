Feature: Access the full description for a job

    Scenario: Authenticated User accesses the full description for a job at FEUP's Job Bank
    When I tap the "feupsjobbank" button
    And I fill the "usernameinput" field with "up200012345"
    And  I fill the "passwordinput" field with "1234"
    And I tap the "login" button
    And I tap the "firstJobListing" element
    Then I expect the element "fullJobListing" to be present within 10 seconds