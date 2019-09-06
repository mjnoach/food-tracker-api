## Installation

1. Run `rails s`. This will generate `tmp/development_secret.txt`  
2. In root directory create `.env` file based on `.env_example`  
   Set the `SECRET_KEY_BASE` variable to the string generated in `tmp/development_secret.txt`  
2. Run `bundle install`  
3. Run `rake db:create db:migrate`
4. Run `rails s`  

Remember to configure server ports according with the Client APP.

## Client APP:
https://github.com/mjnoach/food-tracker-client
