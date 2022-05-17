Feature: Show all job listings at FEUP's job bank
    Scenario: Authenticated User consults all job listings at FEUP's job bank
    When I tap the "jobsatfeup" button
    Then I expect the text "Jobs at FEUP" to be present