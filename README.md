# Autodesk Code Assessment

A sample end to end test suite to showcase my skills and methodology with end to end testing.

For demonstration purposes, this test uses a clone of the Google Calculator app found here: https://github.com/warlock1996/google-calculator-clone

The real Google Calculator has several countermeasures in place that prevent end to end tests from working reliably.

# Setup
- Install [Google Chrome](https://www.google.com/chrome/)
- Install [nvm](https://github.com/nvm-sh/nvm)
- In your terminal, run:
  - `nvm install` to install the correct node version (loaded from the `.nvmrc` file)
  - `npm install` to install dependencies

# Running Tests
- In the `google-calculator-clone` repo, run the following:
  - `npm install` to install dependencies
  - `npm run dev` to serve the Calculator clone app
- In this repo, run the following:
  - `npm run test:ui` to execute test suite in ui mode
  OR
  - `npm run test:terminal` to execute tests in terminal mode
