import { Before, Then, When } from "@badeball/cypress-cucumber-preprocessor";
import {
  UIElement,
  calculatorUISelectors,
} from "../../support/PageData/CalculatorUI";
import {
  mathSymbolToKeystroke,
  parseMathExpressionToClicks,
} from "../../support/Utilities";

/**
 * By default, Cypress runs in "test isolation" mode, where the state of each test
 * is kept isolated from one another. In practice, for more complex tests, I occasionally use
 * `BeforeAll` to set up the test conditions a single time before all tests are run. This retains
 * the test state between tests, which can be useful if slow test execution times are a concern.
 * For example, it may not be desirable to simulate a user logging in and navigating to a page
 * and wait for it to multiple times every time a test is run.
 */
Before(() => {
  const url = "http://localhost:5173/";
  cy.visit(url);
});

When(
  "the user enters {string} into the calculator via mouse clicks",
  (input: string) => {
    parseMathExpressionToClicks(input);
  }
);

When(
  "the user enters {string} into the calculator via the keyboard",
  (input: string) => {
    const selector = calculatorUISelectors.get(UIElement.Display);

    cy.get(selector).click();

    input = mathSymbolToKeystroke(input);

    cy.get(selector).type(input);
  }
);

Then(
  "the {string} shows {string}",
  (displayElement: UIElement, displayedText: string) => {
    const selector = calculatorUISelectors.get(displayElement);

    /**
     * Added because Cypress erroneously reports "" does not equal "" in
     * the assertion at the end of this function. This is a workaround.
     *
     * Ordinarily, using `invoke` should be used sparingly as it can
     * be slower.
     * */
    if (displayedText === "") {
      cy.get(selector).invoke("text").should("be.empty");

      return;
    }

    // If this is for the last math expression, add an equals sign
    if (displayElement === UIElement.LastMathExpression) {
      displayedText += " =";
    }

    cy.get(selector).should("have.text", displayedText);
  }
);

When("the user clicks the {string} button", (button: UIElement) => {
  const selector = calculatorUISelectors.get(button);

  cy.get(selector).click();
});

When("the user presses the {string} key", (key: string) => {
  const selector = calculatorUISelectors.get(UIElement.Display);

  cy.get(selector).type(`"{${key}}"`);
});
