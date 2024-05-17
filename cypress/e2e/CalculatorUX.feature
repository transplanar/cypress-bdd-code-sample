Feature: UI Responses
  Confirms that the UI responds appropriately to user input

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

  Scenario: The User Can Continue a Math Expression After Clicking Equals
    When the user enters "2 + 1" into the calculator via mouse clicks
    And the user clicks the "=" button
    And the user enters "+ 3" into the calculator via mouse clicks
    And the user clicks the "=" button
    Then the "display" shows "6"
    And the "last math expression" shows "3 + 3"

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

  Scenario: All Numeric Buttons Work
    When the user enters "1234567890" into the calculator via mouse clicks
    And the user clicks the "=" button
    Then the "display" shows "1234567890"