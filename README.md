# quart-app-template
Use the template of this repository to create the new quart based service

## Getting started

1. Use the template of this repository to create the new quart based service
2. Install all the python dependencies for development using `pip install -r requirements.txt --no-cache-dir`
3. Create a `.env` file for the quart app
4. Run the server on localhost using `uvicorn app.server:app --reload --port 8000`


## Unit Test Cases

The name of the test file should always start with `test` so that pytest can automatically detect all the test files.

Please note below points for test file.
- DB Initialization needs to be done.
- Routes needs to be registered.
- Any other initialization done that is required would need to be imported and intialized (eg. redis)

To run the entire test suite, `pytest` command can be run.

To run any specific test file, `pytest file_name` command can be run.

Note :- pip install of requirements.test.txt required to install packages required for running unit test cases.