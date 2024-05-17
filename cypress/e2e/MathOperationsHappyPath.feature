Feature: Math Operations Happy Path
    Tests each of the basic math operations.

  Scenario: The Display and Last Math Expression are updated after a math operation (Sample: Addition)
    When the user enters "2 + 1" into the calculator via mouse clicks
    And the "display" shows "2 + 1"
    And the user clicks the "=" button
    Then the "display" shows "3"
    And the "last math expression" shows "2 + 1"

  Scenario: The Previous Math Expression is Retained after a New Math Expression is Started
    When the user enters "2 + 1" into the calculator via mouse clicks
    And the "display" shows "2 + 1"
    And the user clicks the "=" button
    Then the "display" shows "3"
    When the user enters "4 + 3" into the calculator via mouse clicks
    And the "last math expression" shows "2 + 1"

  Scenario: The AC (All Clear) Button Erases the Last Input Entered Before Equals is Clicked
    When the user enters "2 + 1" into the calculator via mouse clicks
    And the user clicks the "AC" button
    Then the "display" shows "2 +"

  Scenario: The AC (All Clear) Button Erases All Input and The Last Math Expression After Equals is Clicked
    When the user enters "2 + 1" into the calculator via mouse clicks
    And the user clicks the "=" button
    And the user clicks the "AC" button
    Then the "display" shows ""
    And the "last math expression" shows ""

  Scenario: The User Can Interact with the Calculator via Keyboard Input
    When the user enters "2 + 1" into the calculator via the keyboard
    And the user presses "enter"
    Then the "display" shows "3"
    And the "last math expression" shows "2 + 1"

  Scenario: The User Can Continue a Math Expression After Clicking Equals
    When the user enters "2 + 1" into the calculator via mouse clicks
    And the user clicks the "=" button
    And the user enters "+ 3" into the calculator via mouse clicks
    And the user clicks the "=" button
    Then the "display" shows "6"
    And the "last math expression" shows "3 + 3"

  Scenario: Order of Operations for Mixed Math Expressions Works is Followed
    When the user enters "2 + 1 - 3 × 4 ÷ 2" into the calculator via mouse clicks
    And the user clicks the "=" button
    Then the "display" shows "-3"
    And the "last math expression" shows "2 + 1 - 3 × 4 ÷ 2"

  # NOTE: If writing out the input is impractical, write it as a sentence instead
  Scenario: Large Numbers are Converted to Scientific Notation
    When the user enters an excessively long number into the calculator via the keyboard
    And the user presses "enter"
    Then the "display" shows the number in scientific notation

  # NOTE Not functional, as clone does not have this capability
  # NOTE history displays each side of the equal sign in a separate element
  # in the real implementation, the step definition would parse each assertion
  # accordingly
  @ignore
  Scenario: Clicking the History Button Displays the Most Recent 
    When the user enters "2 + 1" into the calculator via mouse clicks
    And the user clicks the "=" button
    And the user enters "4 - 5" into the calculator via mouse clicks
    And the user clicks the "=" button
    And the user enters "99 + 3 ÷ 55" into the calculator via mouse clicks
    And the user clicks the "=" button
    And the user clicks the "history" button
    Then the history displays "2 + 1 = 3"
    And the history displays "4 - 5 = -1"
    And the history displays "99 + 3 ÷ 55 = 99.05454545454545" 

  # NOTE Not functional, as clone does not have this capability.
  # NOTE this deviates from what is shown in the instructions, where a "More Information" link 
  # is displayed instead
  @ignore
  Scenario: Clicking the "Feedback" Link Displays Information Modal
    When the user clicks the "feedback" link
    Then the "feedback" modal is displayed

  Scenario: Prefixing a Number with Minus (-) is Treated as a Negative Number
    When the user enters "- 2 + 1" into the calculator via mouse clicks
    And the user clicks the "=" button
    Then the "display" shows "-1"
    And the "last math expression" shows "- 2 + 1"

  Scenario: Subtraction Operations are Performed Correctly
    When the user enters "88 - 23" into the calculator via mouse clicks
    And the user clicks the "=" button
    Then the "display" shows "65"
    And the "last math expression" shows "88 - 23"

  Scenario: Multiplication Operations are Performed Correctly
    When the user enters "88 × 23" into the calculator via mouse clicks
    And the user clicks the "=" button
    Then the "display" shows "2024"
    And the "last math expression" shows "88 × 23"
    
  Scenario: Division Operations are Performed Correctly
    When the user enters "88 ÷ 23" into the calculator via mouse clicks
    And the user clicks the "=" button
    Then the "display" shows "3.8260869565217392"

  Scenario: Dividing by Zero Results a Result of Infinity
    When the user enters "88 ÷ 0" into the calculator via mouse clicks
    And the user clicks the "=" button
    Then the "display" shows "Infinity"

  Scenario: Negative Numbers are Handled Correctly
    When the user enters "- 88 ÷ 23" into the calculator via mouse clicks
    And the user clicks the "=" button
    Then the "display" shows "-3.8260869565217392"
    And the "last math expression" shows "- 88 ÷ 23"

  Scenario: Decimal Numbers are Handled Correctly
    When the user enters "88.5 ÷ 23" into the calculator via mouse clicks
    And the user clicks the "=" button
    Then the "display" shows "3.8478260869565215"

  Scenario: An Error Message is Displayed if the User Presses the Equals Sign Without Completing their Math Expression
    When the user enters "88 ÷" into the calculator via mouse clicks
    And the user clicks the "=" button
    Then the "display" shows "Error"

  Scenario: Invalid Characters are Ignored When Using Keyboard Input
    When the user enters "88 ÷ 23" into the calculator via the keyboard
    And the user enters "a" into the calculator via the keyboard
    And the user presses "enter"
    Then the "display" shows "3.8260869565217392"
