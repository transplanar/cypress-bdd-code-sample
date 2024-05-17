Feature: Math Operations Happy Path
    Tests each of the basic math operations.

  Scenario: The Display and Last Math Expression are updated after a math operation (Sample: Addition)
    When enters "2 + 1" into the calculator via mouse clicks
    And the "display" shows "2 + 1"
    And the user clicks the "=" button
    Then the "display" shows "3"
    And the "last math expression" shows "2 + 1"
#   Scenario: Addition
#   Scenario: Subtraction
#   Scenario: Multiplication
#   Scenario: Division
