# Methodology

1. Make first pass on supporting documentation to establish a test plan
2. Assess the requirements of this test assignment
3. Compile a list of needs and edge cases to test. Additionally include key assumptions.
4. Confer with public resources on best practices for testing this type of application (calculator)
5. Familiarize myself with the real Google calculator app and how it works
6. Write feature files containing Cucumber scenarios for testing for happy path scenarios
7. Write step definitions for implementation details, heavily using reusable code to be housed in the `common-steps.ts`
8. Ascertain edge cases and prioritize based on fictional user needs and target user personas

# Assumptions

- This is a fictional scenario where the Google calculator app has only recently been created
- This fictional Google calculator app behaves like the real one, minus the capabilities of the blurred out buttons as shown in the instructions
- This fictional Google calculator uses the same selectors (ids, classes, etc) as the real one
- User is able to interact with the app via keyboard or mouse on a computer or laptop or touch on a smart device
- Keyboard input is restricted to the numeric keys and mathematical function characters matching the unblurred calculator buttons from the instructions. The exception to this is the `e` character, to support scientific notation for very large numbers.
- Chrome is our target browser

# Capabilities

- Numeric buttons
- Mathematical operations
  - Addition
  - Subtraction
  - Multiplication
  - Division
  - Equals Button
- History Feature
- Additional buttons
  - Decimal point
  - Erase (AC button)
  - More Info Link
    - NOTE: This is now a "Feedback" link in the real app. Will just assume this goes to a static info page.

# Tools

- [Visual Studio Code](https://code.visualstudio.com/) (code editor)
- [Chrome Browser](https://www.google.com/chrome/) (web browser)
- [Chrome DevTools](https://developers.google.com/web/tools/chrome-devtools) (browser developer tools within Chrome)
- [Cypress.io](https://www.cypress.io/) (end-to-end testing framework)
- [Cypress-Cucumber-Preprocessor](https://github.com/badeball/cypress-cucumber-preprocessor) (Cucumber integration for Cypress)
- [Husky](https://typicode.github.io/husky/#/) (pre-commit hooks)
- [GitHub Copilot](https://copilot.github.com/) (AI pair programming tool)

# NOTES

- You must click and focus the calculator before you can use the keyboard
- Do not assume a backend or database unless stated otherwise
