Feature: Math Operations Happy Path
    Tests each of the basic math operations.

  # Scenario: The Display and Last Math Expression are updated after a math operation (Sample: Addition)
  #   When the user enters "2 + 1" into the calculator via mouse clicks
  #   And the "display" shows "2 + 1"
  #   And the user clicks the "=" button
  #   Then the "display" shows "3"
  #   And the "last math expression" shows "2 + 1"

  # Scenario: The Previous Math Expression is Retained after a new math expression is started
  #   When the user enters "2 + 1" into the calculator via mouse clicks
  #   And the "display" shows "2 + 1"
  #   And the user clicks the "=" button
  #   Then the "display" shows "3"
  #   When the user enters "4 + 3" into the calculator via mouse clicks
  #   And the "last math expression" shows "2 + 1"

  # Scenario: The AC (All Clear) Button Erases the Last Input Entered Before Equals is Clicked
  #   When the user enters "2 + 1" into the calculator via mouse clicks
  #   And the user clicks the "AC" button
  #   Then the "display" shows "2 +"

  # Scenario: The AC (All Clear) Button Erases All Input and The Last Math Expression After Equals is Clicked
  #   When the user enters "2 + 1" into the calculator via mouse clicks
  #   And the user clicks the "=" button
  #   And the user clicks the "AC" button
  #   Then the "display" shows ""
  #   And the "last math expression" shows ""

  # Scenario: The User Can Interact with the Calculator via Keyboard
  #   When the user enters "2 + 1" into the calculator via the keyboard
  #   And the user clicks the "=" button
  #   Then the "display" shows "3"
  #   And the "last math expression" shows "2 + 1"

  # Scenario: The User Can Continue a Math Expression after a math operation
  #   When the user enters "2 + 1" into the calculator via mouse clicks
  #   And the user clicks the "=" button
  #   And the user enters "+ 3" into the calculator via mouse clicks
  #   And the user clicks the "=" button
  #   Then the "display" shows "6"
  #   And the "last math expression" shows "3 + 3"

  # Scenario: Order of Operations for Mixed Math Expressions Works is Followed
  #   When the user enters "2 + 1 × 3" into the calculator via mouse clicks
  #   And the user clicks the "=" button
  #   Then the "display" shows "5"
  #   And the "last math expression" shows "2 + 1 × 3"

  Scenario: Large Numbers are Converted to Scientific Notation
    When the user enters an excessively long number into the calculator via the keyboard
    And the user clicks the "=" button
    Then the "display" shows the number in scientific notation

#   Scenario: Addition
#   Scenario: Subtraction
#   Scenario: Multiplication
#   Scenario: Division

# Incomplete math expressions
# Meta tests (confirm utility functions work)