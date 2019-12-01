## Installation

1. Run `bundle install`  
2. Run `rake db:setup`
3. In root directory create `.env` file based on `.env_example` (`cp .env-example .env`)  
   Set the `SECRET_KEY_BASE` variable to the string generated in `tmp/development_secret.txt`  
4. Run `rails s`  

Remember to configure server ports according with the Client APP.

## Client APP:
https://github.com/mjnoach/food-tracker-client
