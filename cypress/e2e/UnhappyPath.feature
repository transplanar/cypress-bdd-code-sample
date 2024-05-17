Feature: Unhappy Path Scenarios
  Error handling and invalid input test scenarios

  Scenario: Dividing by Zero Results a Result of Infinity
    When the user enters "88 ÷ 0" into the calculator via mouse clicks
    And the user clicks the "=" button
    Then the "display" shows "Infinity"

  Scenario: An Error Message is Displayed if the User Presses the Equals Sign Without Completing their Math Expression
    When the user enters "88 ÷" into the calculator via mouse clicks
    And the user clicks the "=" button
    Then the "display" shows "Error"

  Scenario: Invalid Characters are Ignored When Using Keyboard Input
    When the user enters "88 ÷ 23" into the calculator via the keyboard
    And the user enters "z" into the calculator via the keyboard
    And the user presses the "enter" key
    Then the "display" shows "3.8260869565217392"
