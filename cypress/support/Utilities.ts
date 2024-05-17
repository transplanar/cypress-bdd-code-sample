import { calculatorUISelectors } from "./PageData/CalculatorUI";

export function formatTestId(testId: string): string {
  return `[data-test-id="${testId}"]`;
}

export function parseMathExpressionToClicks(sentence: string): void {
  const components = sentence.split(" ");

  components.forEach((component: string) => {
    const selector = calculatorUISelectors.get(component);

    cy.get(selector)
      .click()
      .then(() => {
        cy.log(`👉 Click the "${component}" button`);
      });
  });
}
