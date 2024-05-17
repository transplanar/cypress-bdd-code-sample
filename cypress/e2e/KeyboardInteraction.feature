Feature: Keyboard Interactions
  User is able to interact with the calculator using the keyboard.

  Scenario: The User Can Interact with the Calculator via Keyboard Input
    When the user enters "2 + 1" into the calculator via the keyboard
    And the user presses the "enter" key
    Then the "display" shows "3"
    And the "last math expression" shows "2 + 1"

  Scenario: The Backspace Key Erases the Last Character Entered (AC functionality via Keyboard Input)
    When the user enters "2 + 1" into the calculator via the keyboard
    And the user presses the "backspace" key
    Then the "display" shows "2 +"