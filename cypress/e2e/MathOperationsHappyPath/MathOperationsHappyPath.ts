import {
  Before,
  BeforeAll,
  Then,
  When,
} from "@badeball/cypress-cucumber-preprocessor";

BeforeAll(() => {
  const url = "https://www.google.com/";
  cy.visit(url);
  const searchContent = "calculator";
  // cy.get('textarea[name="q"]').type(searchContent).type("{enter}");
  // cy.get('input[name="q"]').type(searchContent).type("{enter}");
  cy.get('textarea[name="q"]').invoke("val", searchContent).type("{enter}");
  cy.get("div.ULSxyf").should("be.visible");
});

When(
  "enters {string} into the calculator via mouse clicks",
  (input: string) => {
    // // code to enter input into the calculator via mouse clicks
    const button1 = cy.get(
      ".ElumCf > tbody > :nth-child(4) > :nth-child(1) > .PaQdxb > .XRsWPe"
    );
    const button2 = cy.get(
      ".ElumCf > tbody > :nth-child(4) > :nth-child(2) > .PaQdxb > .XRsWPe"
    );

    button1.click();
    button2.click();

    // cy.get(button1Selector).contains("1").click({ force: true });
    // cy.get("div").contains("+").click();
    // cy.get("div").contains("2").click();
  }
);

Then("the calculator display shows {string}", (display: string) => {
  // code to verify the calculator display shows the expected value
});

Then("the running total is displayed as {string}", (total: string) => {
  // code to verify the running total is displayed as the expected value
});
