# Autodesk Code Assessment

A sample end to end test suite to showcase my skills and methodology with end to end testing.

For demonstration purposes, I am using a clone of the Google Calculator app forked from https://github.com/warlock1996/google-calculator-clone. The version included with my submission materials contains minor modifications to fix missing selectors.

The real Google Calculator has several countermeasures in place that prevent end to end tests from working reliably.

# Setup
- Install [Google Chrome](https://www.google.com/chrome/)
- Install [nvm](https://github.com/nvm-sh/nvm)
- Clone this repo in the manner you like: https://github.com/transplanar/autodesk-code-assessment
- Clone the Google Calculator clone repo in the manner you like: https://github.com/transplanar/google-calculator-clone
- In your terminal, navigate to this repo and run:
  - `nvm install` to install the correct node version (loaded from the `.nvmrc` file)
  - `npm install` to install dependencies

# Running Tests
- Open a terminal instance in the `google-calculator-clone` repo, then run the following:
  - `npm install` to install dependencies
  - `npm run dev` to serve the Calculator clone app
- Open a terminal instance in this repo, then run either of the following:
  - `npm run test` to execute test suite in ui mode
  - `npm run test:terminal` to execute tests in terminal mode
