# To Do App
> Demos Rails MVC full-stack application with simple ActiveRecord Association (One-to-Many)

## Requirements and Versions
* For Rails app
    * Ruby version = `ruby-3.2.0`
    * Rails version = `Rails 7.0.4.2`
* For authentication
    * bcrypt
* For test framework
    * requires: webdriverio, typescript, chromedriver, allure-reporter, allure-commandline
    * see `package.json` for versioning details
```json
{
  "name": "my-new-project",
  "type": "module",
  "devDependencies": {
    "@wdio/allure-reporter": "^8.5.0",
    "@wdio/cli": "^8.5.1",
    "@wdio/local-runner": "^8.5.1",
    "@wdio/mocha-framework": "^8.4.0",
    "@wdio/spec-reporter": "^8.4.0",
    "chromedriver": "^110.0.0",
    "ts-node": "^10.9.1",
    "typescript": "^4.9.5",
    "wdio-chromedriver-service": "^8.1.1",
    "wdio-wait-for": "^3.0.2"
  },
  "scripts": {
    "wdio": "wdio run ./wdio.conf.ts"
  },
  "dependencies": {
    "allure-commandline": "^2.21.0"
  }
}
```

## Testing
> The ToDo app is also set up to run e2e tests using WebDriverIO and Mocha.
### Background
* [WebDriverIO: Getting Started](https://webdriver.io/docs/gettingstarted#run-test)
    * WebDriverIO Docs 

### Running Tests
* run `npm run wdio` in your terminal

### Reports
* This uses Allure Reports and generates results in `./allure-results` with the artifacts for viewing the reports in `./allure-report`
* To view the report, serve `./index.html` (VS Code's live server works fine)
* Spec reporter is also used and will output results to your terminal

