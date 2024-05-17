# Autodesk Code Assessment

A sample end to end test suite to showcase my skills and methodology with end to end testing.

For demonstration purposes, this test uses a clone of the Google Calculator app found here: https://github.com/warlock1996/google-calculator-clone

The real Google Calculator has several countermeasures in place that prevent end to end tests from working reliably.

# Setup

- Install [nvm](https://github.com/nvm-sh/nvm)
- `nvm install` to set node version with
- `npm install` to install dependencies

# Running Tests

- In the `google-calculator-clone` repo, run the following:
  - `npm install` to install dependencies
  - `npm run dev` to serve the Calculator clone app
- `npm run test:ui` to execute test suite in ui mode
- `npm run test:terminal` to execute tests in terminal mode
