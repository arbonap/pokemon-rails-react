## Indiegogo Campaign Search
#### _Search through Indiegogo campaigns fundraising for unique causes_
![Indiegogo Campaign Search](./indiegogo-searc.gif)

## Don't feel like setting this up locally on your machine?
#### No worries, click [here](https://obscure-waters-39090.herokuapp.com/) to search through Indiegogo Campaigns
## To set this project up locally:
- Before we begin, this project uses `Ruby 2.3`, `Rails 4`, and `postgres`.
Make sure you have these configured on your machine. Make sure `postgres` is running.

  - ** Remember: If you downloaded `postgres` via the separate OSX app, make sure the
elephant is in your taskbar. **


-  In the terminal, `git clone git@github.com:arbonap/campaigns.git`
- `bundle install` all the gems.
- `rake db:create` to create your database in Postgres.
- `rake db:migrate` to run database migrations.
- `rake db:seed` to seed your local database.
  - ** Note: you _must_ seed your database, if not you will not see any data in your app **
- Run `rails s` to start the server
- Go to `localhost:3000` in the browser to see the magic ✨

## To run tests:
- In the root of project folder, run `rspec spec` to run all of the `rspec` tests

## Voilá! 🍒
