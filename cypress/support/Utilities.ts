import { UIElement, calculatorUISelectors } from "./PageData/CalculatorUI";

export function formatTestId(testId: string): string {
  return `[data-test-id="${testId}"]`;
}

export function parseMathExpressionToClicks(expression: string): void {
  const components = expression.split(" ");

  components.forEach((component: string) => {
    const selector = calculatorUISelectors.get(component);

    cy
      .get(selector)
      .click()
      .then(() => {
        cy.log(`👉 Click the "${component}" button`);
      });
  });
}

export function convertToScientificNotation(number: string): string {
  const num = parseFloat(number);
  return num.toExponential();
}

export function clickAndLog(selector: string, buttonName: UIElement) {
  cy.get(selector)
    .click()
    .then(() => {
      cy.log(`👉 Click the "${buttonName}" button`);
    });
}