Feature: Validate Calculations
  Validates that sample math calculations are correct
  
  Scenario: Addition Operations are Performed Correctly
    When the user enters "88 + 23" into the calculator via mouse clicks
    And the user clicks the "=" button
    Then the "display" shows "111"
    And the "last math expression" shows "88 + 23"

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

  Scenario: Order of Operations for Mixed Math Expressions Works is Followed
    When the user enters "2 + 1 - 3 × 4 ÷ 2" into the calculator via mouse clicks
    And the user clicks the "=" button
    Then the "display" shows "-3"
    And the "last math expression" shows "2 + 1 - 3 × 4 ÷ 2"

  # NOTE: If writing out the input is impractical, write it as a sentence instead
  Scenario: Large Numbers are Converted to Scientific Notation
    When the user enters an excessively long number into the calculator via the keyboard
    And the user presses the "enter" key
    Then the "display" shows the number in scientific notation

  Scenario: Prefixing a Number with Minus (-) is Treated as a Negative Number
    When the user enters "- 2 + 1" into the calculator via mouse clicks
    And the user clicks the "=" button
    Then the "display" shows "-1"
    And the "last math expression" shows "- 2 + 1"

  Scenario: Negative Numbers are Handled Correctly
    When the user enters "- 88 ÷ 23" into the calculator via mouse clicks
    And the user clicks the "=" button
    Then the "display" shows "-3.8260869565217392"
    And the "last math expression" shows "- 88 ÷ 23"

  Scenario: Decimal Numbers are Handled Correctly
    When the user enters "88.5 ÷ 23" into the calculator via mouse clicks
    And the user clicks the "=" button
    Then the "display" shows "3.847826086956522"