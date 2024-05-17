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