import {
  Before,
  BeforeAll,
  Then,
  When,
} from "@badeball/cypress-cucumber-preprocessor";
import { parseMathExpressionToClicks } from "../../support/Utilities";
import {
  UIElement,
  calculatorUISelectors,
} from "../../support/PageData/CalculatorUI";

BeforeAll(() => {
  const url = "http://localhost:5173/";
  cy.visit(url);
});

When(
  "enters {string} into the calculator via mouse clicks",
  (input: string) => {
    parseMathExpressionToClicks(input);
  }
);

Then(
  "the {string} shows {string}",
  (displayElement: UIElement, displayedText: string) => {
    const selector = calculatorUISelectors.get(displayElement);

    // If this is for the last math expression, add an equals sign
    if (displayElement === UIElement.LastMathExpression) {
      displayedText += " =";
    }

    cy.get(selector)
      .should("have.text", displayedText)
      .then(() => {
        cy.log(`🧐 "${displayElement}" should contain text "${displayedText}"`);
      });
  }
);

When("the user clicks the {string} button", (button: UIElement) => {
  const selector = calculatorUISelectors.get(button);

  cy.get(selector).click();
});
