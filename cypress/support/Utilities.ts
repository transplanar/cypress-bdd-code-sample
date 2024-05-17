import { calculatorUISelectors } from "./PageData/CalculatorUI";

/**
 * Takes a string and returns it wrapped in a data-test-id attribute selector string.
 * 
 * @param testId - The test ID to format.
 * @returns The formatted test ID as a string.
 * @example
 * formatTestId('login-button');
 * // Returns '[data-test-id="login-button"]'
 */
export function formatTestId(testId: string): string {
  return `[data-test-id="${testId}"]`;
}

/**
 * Parses a math expression and performs clicks on the calculator UI based on the digits and characters in the expression.
 * 
 * @param expression - The math expression to parse.
 * @example
 * parseMathExpressionToClicks("1 + 2");
 * // This will click the 1, +, and then 2 buttons in that order on the calculator UI.
 */
export function parseMathExpressionToClicks(expression: string): void {
  const components = expression.split(" ");

  components.forEach((component: string) => {
    component.split("").forEach((digit: string) => {  
      const selector = calculatorUISelectors.get(digit);

      cy
        .get(selector)
        .click();
    });
  });
}

/**
 * Replaces math symbols in the input string with their corresponding keystrokes.
 * 
 * @param input - The input string containing math symbols.
 * @returns The modified string with math symbols replaced by keystrokes.
 * 
 * @example
 * mathSymbolToKeystroke("2 × 3 ÷ 4");
 * // Returns "2 * 3 / 4"
 */
export function mathSymbolToKeystroke(input: string): string {
  input = input.replace("÷", "/");
  input = input.replace("×", "*");
  
  return input;
}