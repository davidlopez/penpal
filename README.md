## PenPal README

### About Penpal:
* Penpal is an application is an interactive app that, that after filling in information about yourself and what helps you in times of feeling down, de-motivated or alone. The app can send alerts notifying specified loves ones/friends. The user interacts with the app regularly, recording a current mood and receiving suggestions from Penpal. Suggestions can include activities, it can play music that helps or show you cute photos of animals. There is a place to journal and eventually will have the ability to track moods and activities to help you learn more about yourself.

* Penpal uses Ruby -v 2.5.0
* You will need access tokens for Spotify and Pexel
* You will need Penpal Api Sinatra mircroservice 
* If you want to look at it in testing development you will need Redis, Sidekiq
* If you want to look at it in Production, you will need to


### Testing Technologies
* [rspec](https://github.com/rspec/rspec)
* [factory_bot_rails](https://github.com/rubocop-hq/rubocop)
* [faker](https://github.com/faker-ruby/faker)
* [pry](https://github.com/pry/pry)
* [capybara](https://github.com/teamcapybara/capybara)
* [shoulda-matchers](https://github.com/thoughtbot/shoulda-matchers)
* [simplecov](https://github.com/colszowka/simplecov)
* [webmock](https://github.com/bblimke/webmock)
* [mailcatcher](https://mailcatcher.me/)


### Deployment instructions
*To begin, clone down the Penpal master repo from git clone https://github.com/Not-Zorro/penpal
* cd into penpal
* Bundle
* Set up the database (rake db: {create, migrate, seed})
* Run redis-server redis-cli
* In separate terminal, run a sidekiq process
* In a third terminal, launch your local server

* Next, please clone down the Penpal API micro-service into a sibling folder
