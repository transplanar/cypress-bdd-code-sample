Feature: Ancillary UI Elements
  Tests for the ancillary UI elements of the app, such as the History Button

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