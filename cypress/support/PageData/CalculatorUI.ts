import { SmartMap } from "../SmartMap";
import { formatTestId } from "../Utilities";

/**
 * Strictly speaking, this could be split into
 * separate enums and maps for interactive versus
 * display elements. For simplicity, I will keep
 * them together here.
 */
export enum UIElement {
  Display = "display",
  One = "1",
  Two = "2",
  Three = "3",
  Four = "4",
  Five = "5",
  Six = "6",
  Seven = "7",
  Eight = "8",
  Nine = "9",
  Zero = "0",
  Equals = "=",
  Decimal = ".",
  Plus = "+",
  Minus = "-",
  Multiply = "×",
  Divide = "÷",
  AllClear = "AC",
  LastMathExpression = "last math expression",
}

export const calculatorUISelectors = new SmartMap<UIElement | string, string>([
  [UIElement.Display, formatTestId("input")],
  [UIElement.One, formatTestId("1")],
  [UIElement.Two, formatTestId("2")],
  [UIElement.Three, formatTestId("3")],
  [UIElement.Four, formatTestId("4")],
  [UIElement.Five, formatTestId("5")],
  [UIElement.Six, formatTestId("6")],
  [UIElement.Seven, formatTestId("7")],
  [UIElement.Eight, formatTestId("8")],
  [UIElement.Nine, formatTestId("9")],
  [UIElement.Zero, formatTestId("0")],
  [UIElement.Equals, formatTestId("=")],
  [UIElement.Decimal, formatTestId(".")],
  [UIElement.Plus, formatTestId("+")],
  [UIElement.Minus, formatTestId("-")],
  [UIElement.Multiply, formatTestId("×")],
  [UIElement.Divide, formatTestId("÷")],
  [UIElement.AllClear, formatTestId("AC")],
  [UIElement.LastMathExpression, formatTestId("expression")],
]);
