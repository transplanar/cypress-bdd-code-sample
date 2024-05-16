import { Before, Then, When } from "@badeball/cypress-cucumber-preprocessor";

Before(() => {
  const url = "https://www.google.com/search?q=calculator";

  cy.visit(url);
});

When(
  "enters {string} into the calculator via mouse clicks",
  (input: string) => {
    // code to enter input into the calculator via mouse clicks
  }
);

Then("the calculator display shows {string}", (display: string) => {
  // code to verify the calculator display shows the expected value
});

Then("the running total is displayed as {string}", (total: string) => {
  // code to verify the running total is displayed as the expected value
});
