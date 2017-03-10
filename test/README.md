# Functional Tests

***Getting Started - Local Development Environment***

Run the following:

```
npm install
npm install selenium-standalone@latest -g
selenium-standalone install
```

Set Environment Variables

Set TEST_ENDPOINT Environment Variable
```
export TEST_ENDPOINT="http://localhost:3000"
```

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
