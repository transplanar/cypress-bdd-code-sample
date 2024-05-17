import { Then, When } from "@badeball/cypress-cucumber-preprocessor";
import { calculatorUISelectors, UIElement } from "../../support/PageData/CalculatorUI";

const digits = "12";
const repeatDigitCount = 50;
const excessivelyLongNumber = digits.repeat(repeatDigitCount);
const excessivelyLongNumberScientificNotation = "1.2121212121212122e+99";

When(
  "the user enters an excessively long number into the calculator via the keyboard",
  () => {
    const selector = calculatorUISelectors.get(UIElement.Display);

    cy.get(selector).click();

    cy.get(selector).type(excessivelyLongNumber);
  }
);

Then(
  "the {string} shows the number in scientific notation",
  (displayElement: UIElement) => {
    const selector = calculatorUISelectors.get(displayElement);

    cy.get(selector).should(
      "have.text",
      excessivelyLongNumberScientificNotation
    );
  }
);
