# Assignment
The assignment for this assessment is to create an end to end test framework for a fictional Google Calculator app. It resembles the real calculator app, but does not have all of its advanced math functions.

See the README.md file for details on how to setup and run the tests I have provided.

## Submission Materials
- [Github Link to This Repository](https://github.com/transplanar/autodesk-code-assessment)
- [Github Link to the Google Calculator Clone Repository](https://github.com/transplanar/google-calculator-clone)
- PDF and Markdown version of this text file

# Methodology
1. Make first pass on supporting documentation to establish a test plan
2. Assess the requirements of this test assignment
3. Compile a list of needs and edge cases to test. Additionally include key assumptions.
4. Confer with public resources on best practices for testing this type of application (calculator)
5. Familiarize myself with the real Google calculator app and how it works
6. Write feature files containing Cucumber scenarios for happy path scenarios
7. Write step definitions for implementation details, heavily using reusable code to be housed in the `common-steps.ts`
8. Create cucumber scenarios for edge cases and error scenarios
9. Write step definitions for edge cases and error scenarios
10. Refactor and cleanup code as needed to organize tests logically

## Additional Notes
- I have included some inline comments to explain my reasoning for certain code choices

# Approach

My approach is built upon the principles of developer ergonomics and behavior-driven development.

## Developer Ergonomics

At each stage, I try to write tests that are highly readable, even to a non-technical audience. I use descriptive function and variable names to make my tests as self-documenting as possible. When using more abstract, reusable functions, I ensure there is appropriate annotation (via the JSDocs feature) for other developers to easily reference when they hover over the function or variable.

## Behavior-Driven Development

These tests are written using the cypress-cucumber-preprocessor plugin for Cypress. Tests using this tool consist of a "feature file" containing Cucumber scenarios and a corresponding "step definitions" file containing the implementation of the test logic.

This approach allows Cucumber scenarios to be shared among team members, product owners, and other stakeholders. It outlines the expected behavior of the application in a human-readable format, promoting alignment across the team. When supported by a mature set of reusable step definitions, this allows tests to be developed while the features under test are being developed. SDETs don't have to wait until the feature is complete.

### Scenario to Step Definition Mapping
The default convention is for a particular feature file to have a corresponding step definitions file in a directory matching the name as shown below.

When Cypress parses through a feature file, it will look at the text of each statement to locate its corresponding step definition. It will first look in the `.ts` file matching the name of the feature file. If a match is not found, it will then look in the `common-steps.ts` file (a common library of test steps used across multiple feature files).

#### Directory Structure Example
```
/cypress
-- /e2e
---- /MyCoolFeature
------ MyCoolFeature.ts
---- MyCoolFeature.feature
...
---- /support
------ /step_definitions
-------- common-steps.ts
```

#### Scenario to Step Definition Mapping Example
If a feature file contains the following scenario:
```gherkin
Scenario: User can add two numbers
  ...
  When the user enters "2 + 2" into the calculator via mouse clicks
  ...
```
It will match with the following step definition function:
```typescript
When("the user enters {string} into the calculator via mouse clicks", (mathExpression: string) => {
  ...
});
```
Note that text in the feature file enclosed in quotes is interpretted as a parameter and passed into the step definition function.

For this example test suite, most of the step definition functions are in the `common-steps.ts` file. Only one suite (ValidateCalculations) retains a step definition file corresponding to its feature file.
 
## Reusable Code
Code reuse is achieved by carefully wording feature file scenarios to be paramaterized and used in a variety of scenarios. See the "[Element Lookup](#element-lookup)" section below for more details.

# Assumptions
- This is a fictional scenario where the Google calculator app has only recently been created
- This fictional Google calculator app behaves like the real one, minus the capabilities of the blurred out buttons as shown in the instructions
  - NOTE due to issues encountered attempting to integrate with the real Google Calculator, I will be using a clone of the Google Calculator app instead. This clone is a close approximation of the real Google Calculator app, with a few exceptions. I call out these differences in the "[Differences Between Real Google Calculator and Google Calculator Clone](#differences-between-real-google-calculator-and-google-calculator-clone)" section below. Using this clone ensures the tests I provided are reliably executable. 
  - As a result, the user's action of opening up Google and typing in "calculator" will be skipped.
- User is able to interact with the app via keyboard or mouse on a computer or laptop or touch on a smart device
- Keyboard input is restricted to the numeric keys and mathematical function characters matching the unblurred calculator buttons from the instructions. 
- Chrome is the target browser used for these tests
- Following the test pryamid model, I will assume the accuracy of the mathematical operations has been tested via unit tests. As such, I will prioritize testing user interactions behave as expected rather than exhaustively confirm calculations are correct.
- I assume the real-world Google Calculator would have some way of determining the user's geographic region and localize the display of decimal numbers (e.g. using a comma instead of a period). I will be excluding this from my tests here for the sake of focusing time elsewhere.

# Scope
Tests included in this suite will excercise the following: 

## Functionality
- All buttons work
- A sample of mathematical operations work
- The history feature works (tests stubbed, but not functional)
- Continuing math calculations after pressing the equals button
- Error states
- Invalid inputs are handled
  - Divide by zero
  - Invalid characters
  - Very large numbers
- Negative numbers
- Decimal numbers

## UI Components
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

## Out of Scope
- Mobile Testing
  - Google Calendar does have a mobile version, but neither the real Google Calendar nor the clone utilize responsive design. As such, it would require a separate tool, such as Saucelabs for manual mobile testing or Appium for automated mobile testing.

# Tools
- [Visual Studio Code](https://code.visualstudio.com/) (code editor)
- [Chrome Browser](https://www.google.com/chrome/) (web browser)
- [Chrome DevTools](https://developers.google.com/web/tools/chrome-devtools) (browser developer tools within Chrome)
- [Cypress.io](https://www.cypress.io/) (end-to-end testing framework)
- [Cypress-Cucumber-Preprocessor](https://github.com/badeball/cypress-cucumber-preprocessor) (Cucumber Integration Plugin for Cypress)
- [GitHub Copilot](https://copilot.github.com/) (AI pair programming tool for faster code writing)

# Process Log
## Attempt to Interact with Real Google Calculator
I started by setting up tests to run against the real google.com and its calculator component. Unfortunately, this posed several problems. For one, even loading the page in Cypress reliably has proven difficult. It seems to run additional scripts that trip up Cypress's ability to detect it is on the page correctly, stalling test execution. So it does not reliably load the page that is useful for testing.

On the few attempts where the calculator was reached, the buttons themselves lack unique selectors, or where they do exist, they appear to be auto-generated. In order to reliably perform end to end tests, stable, unique selectors are required to interact with the page elements. As a result, the real Google Calculator will not be suitable for this testing excercise.

## Alternative to Using Real Google Calculator
I have, however, found a clone of the Google Calculator that works perfectly. Its functionality is almost identical to the real Google Calculator, with a couple exceptions. It also has unique selectors for each element on the page. For the purposes of this excerise, I will be using this "Google Calculator Clone" instead, and call out any places where its functionality differs from the real Google Calculator.

## Writing Tests
I started writing tests against the Google Calculator Clone. These are housed originally in the MathOperationsHappyPath.feature file and its corresponding step definitions file. For each statement in the feature file, I have deliberately written them to be reusable and paramaterized. This allows a single step definition to match multiple statements in the feature file, reducing the amount of code duplication.

Each time a Cucumber statement contains text in quotes, that is interpretted by the step definition as a parameter. The step definitions I have written uses these parameters either for looking up the appropriate element or for the input value to be provided to that element.

## Element Lookup
When used for element lookup, parameters are passed into a Map's `get` function to retrieve the appropriate selector. In the case of this repo, the selector data is housed in the `CalculatorUI.ts` file.

`CalculatorUI.ts` uses an enumeration (aka enum) and a Map to store the selectors for each element on the Calculator app UI. The enum is used to create type-safe keys for the Map for easy lookup and to provide guardrails against typos.

Additionally, the "Map" I used is in fact a wrapper class "SmartMap". This was done to make debugging easier when setting up tests. Ordinarily, if you attempt to look up a key that does not exist in a Map, it will return `undefined`. Using the SmartMap, if this happens, it will throw a descriptive error with a list of valid keys. I started using this based on my experience debugging defects in tests at previous jobs.

## Alternative Approach to Page Object Model Pattern
This approach is in contrast to the conventional "Page Object Model" (POM) approach, where selectors are stored in a class and interactions are facilitated via methods. In practice, POM classes end up containing a lot of boilerplate code that is repeated across classes. 

In contrast, this method relies on a smaller set of functions intended for reuse. Instead of POM classes, you instead have "PageData" classes that contain static data about a page (such as selectors). This data is looked up via keys referenced in the feature file.

The result is that as the test suite matures, fewer new methods are required to be written. Future SDETs will not need to write many new step definitions, and can instead focus on creating new test scenarios in feature files and/or new page data in PageData files.


### Example:
Feature File:
```gherkin
When the user clicks the "1" button
```
PageData File:
```typescript
enum UIElement {
  One = "1",
  ...
}
...
export const calculatorUISelectors = new SmartMap<UIElement, string>([
  [UIElement.One, '[data-test-id="1"]'],
  ...
]);
```
Step Definition File:
```typescript
When("the user clicks the {string} button", (button: UIElement) => {
  const selector = calculatorUISelectors.get(button);

   cy
    .get(selector)
    .click();
});
```
Here `{string}` is interpretted as a parameter and passed into the step definition function. The step definition function then uses this parameter to look up the appropriate selector in the `calculatorUISelectors` Map.

### Developer Egonomics and Convienience Functions
In the spirit of developer ergonomics, I went ahead and created a function that allows a test developer to describe typing a math expression in a human-readable manner that is parsed and intepretted as a series of clicks. This makes Cucumber statements less clunky and flow more like normal human conversation.

#### Example
##### Conventional Way
```gherkin
When the user clicks the "2" button
And the user clicks the "+" button
And the user clicks the "1" button
```
This version explicitly calls out step by step what the user is doing.
##### Ergonomic Way
```gherkin
When the user enters "2 + 1" into the calculator via mouse clicks
```
This version is functionally identical to the Conventional Way, but interprets "2 + 1" as a series of clicks on the `2`, `+`, and `1` buttons respectively. See the `parseMathExpressionToClicks` function in `Utilities.ts`.

## Refactoring and Reorganizing
After my first pass at writing tests, I moved around the contents of the one feature file I had into separate ones logically divided by what they were testing. I also moved most of the step definition functions to `common-steps.ts` to be shared across multiple feature files.

# Anatomy of Tests
Each test consists of a `feature` file and a corresponding `step definition` file.

## Feature File
This contains a Cucumber scenario written in Gherkin syntax. It is a human-readable representation of the test case. Each scenario is written to resemble a user story, describing how a user would interact with the application. For each statement in the scenario, there is a corresponding step definition function that implements the behavior described in the scenario.

## Step Definition File
This contains the implementation details of the test case. It is written in TypeScript and uses the Cypress API to interact with the browser. A step definition function can either directly correspond to a particular feature file statement or be a reusable function that can be used across multiple feature files found in `common-steps.ts`.

### Interacting with the Page
One of the benefits of the Google Calculator Clone is that it has unique selectors for each element on the page. These unique selectors are the `data-test-id` custom property added to various elements on the page. It gives Cypress an easy way to locate and interact with the elements and is in line with [best practices recommended by Cypress](https://docs.cypress.io/guides/references/best-practices#Selecting-Elements).

# Differences Between Real Google Calculator and Google Calculator Clone
- The real Google Calculator is embedded in the Google Search Engine. The clone is a standalone component.
- The real Google Calculator has a history button in the top left for reviewing previously entered math expressions and answers. The clone does not.
- The clone does not have a "More Info" or "Feedback" link as the real Google Calculator does (or the reference included in the instructions)
- There is different behavior when a user types numbers after clicking the equals button. 
  - The clone app appends the numbers to the result
  - The real Google Calculator clears the field and starts a new calculation
  - The real app clears the input field and the last expression display
- The clone throws an error if you press the equal sign before completing your math expression. The real app does not.
- In the real calculator, the "AC" button changes to "CE" if you are in the middle of an expression, then changes back to "AC" after you click `=`. The clone functionally behaves the same way, but does not change the text of the button.
- When dealing with negative numbers, the real Google Calculator appends a minus sign to the front of the number (`-2 + 3`). The clone appends the minus sign in front of the number separated by a space (`- 2 + 3`).
- The real Google Calculator rounds decimal numbers to 12 significant digits. The clone rounds to 16 digits.

# Additional Considerations and Future Improvements
- If we were to speculate that this calculator app would be expanded and have more tests in the future, we may want to consider implementing "bail" functionality. For example, suppose we were testing the real calculator app, and had a step where we navigated to google.com. If google.com is not available, we can create logic to prevent all downstream tests from running. The toolset in use in these samples does not have an easy way to do this aside from an if statement for each step definition. Other tools do offer this functionality more natively, however.
- The Cypress-Cucumber-Preprocessor does not have the ability to flag Cucumber scenarios as pending, unlike a tool like SerenityJS. This is a useful flag for writing feature files early in the development process, as it allows you to lay out a roadmap of features. This gives you the benefit of an up-to-date snapshot of what features are complete, failing, or pending, as well as enable more accurate test coverage assessment. Given additional time and resources, one might develop a custom plugin to add this functionality.
- When running in a pipeline, configuring the pipeline to use parallelization is a great way to receive faster test results. This can be achieved when running Cypress in a CI/CD context out of the box. Allowing this to be done locally may be a viable option should the test suite become large and complex, though it would require an additional plugin.
- Implementing a tool like Husky would be ideal for ensuring particular code style guidelines are upheld. It is a great tool for automating linter checks and fixes triggered on commit. When supported with robust, agreed-upon linting rules, this can help ensure code quality and consistency across the team.
- Over time and as the suite grows in complexity, you would likely want to split what is now in `Utilities` into separate helper classes or files for easier discoverability of utility functions.