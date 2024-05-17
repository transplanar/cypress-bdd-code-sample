# Methodology

1. Make first pass on supporting documentation to establish a test plan
2. Assess the requirements of this test assignment
3. Compile a list of needs and edge cases to test. Additionally include key assumptions.
4. Confer with public resources on best practices for testing this type of application (calculator)
5. Familiarize myself with the real Google calculator app and how it works
6. Write feature files containing Cucumber scenarios for testing for happy path scenarios
7. Write step definitions for implementation details, heavily using reusable code to be housed in the `common-steps.ts`
8. Ascertain edge cases and prioritize based on fictional user needs and target user personas

# Approach

My approach is built upon the principles of developer ergonomics and behavior-driven development.

## Developer Ergonomics

At each stage, I try to write tests that are highly readable, even to a non-technical audience. I use descriptive function and variable names to make my tests as self-documenting as possible. When using more abstract, reusable functions, I ensure there is appropriate annotation (via the JSDocs feature) for other developers to easily reference when they hover over the function or variable.

## Behavior-Driven Development

I use a Cucumber-based tool for writing tests. Structurally, this means that tests are divided into

## Reusable Code

- Make use of Maps and key/value pair lookup

# Assumptions

- This is a fictional scenario where the Google calculator app has only recently been created
- This fictional Google calculator app behaves like the real one, minus the capabilities of the blurred out buttons as shown in the instructions
- This fictional Google calculator uses the same selectors (ids, classes, etc) as the real one
- User is able to interact with the app via keyboard or mouse on a computer or laptop or touch on a smart device
- Keyboard input is restricted to the numeric keys and mathematical function characters matching the unblurred calculator buttons from the instructions. The exception to this is the `e` character, to support scientific notation for very large numbers.
- Chrome is our target browser
- The real Google Calculator app is not suitable for testing due to its countermeasures against web scraping. A clone of the Google Calculator app will be used instead, simulating testing this fictional Google Calculator app in a lower environment (instead of embedded within the Google search page). The one thing it does not have is a history button. I will write tests for thi as well, but they will not be executible.
- The clone deviates in some behaviors:
  - After a user clicks the equals button and the result is displayed, if a user continues to type numbers, it will append those numbers to the number in the display. I will write a test based on the real world behavior of the Google Calculator app, but I will mark the test as disabled.

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
- Real google calculator does not have unique selectors. It seems designed against web scraping

# Process

I started by setting up tests to run against the real google.com and its calculator component. Unfortunately, this posed several problems. For one, even loading the page in Cypress reliably has proven difficult. It seems to run additional scripts that trip up Cypress's ability to detect it is on the page. So it does not reliably load the page that is useful for testing.

On the few attempts where the calculator was reached, the buttons themselves lack unique selectors, or where they do exist, they appear to be auto-generated in a way to deter web scraping. As a result, the real Google Calculator will not be suitable for this testing excercise.

I have, however, found a clone of the Google Calculator that works perfectly. It works the same way as the real and fictional Calculator described in the assessment, and crucially already has `data-test-id` custom properties on each button, which will make it far easier to write tests against. I will proceed with using this clone as it suits the purpose of demonstrating my methodology and skills.

# TODO

- Figure out how to flag @ignore tests as skipped
