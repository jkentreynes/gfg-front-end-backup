# Functional Tests

***Getting Started***

Run the following:

```
npm install
npm install selenium-standalone@latest -g
selenium-standalone install
```

Set Environment Variables

Set TEST_ENDPOINT Environment Variable
```
export TEST_ENDPOINT="<value>"
```
Value is the url you want the tests to run. Eg. http://localhost:5000

Set TEST_TYPE Environment Variable
```
export TEST_TYPE="<value>"
```
Value can either be functional, end-to-end or smoke tests.

Running the Test

Start selenium server
```
selenium-standalone start
```

Run via the npm command
```
npm run front-end-tests
