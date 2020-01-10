# PenPal

Click to open the [PenPal app](https://penpal-boost.herokuapp.com/) hosted on Heroku

## Description
PenPal is an interactive Rails web application built from conception to completion that authenticates with a third-party service (Google), consumes multiple APIs (Spotify and Pexel), and provides a solution to an identified problem.

PenPal is intended to support users in times when they are feeling down, unmotivated or alone. Interacting with the app, users are asked to complete a personal survey, after which they can record their current mood and receive a catered suggestion based on their stated preferences. Identified close friends are sent an introductory email notifying them that the user may occasionally connect with them. Suggestions from PenPal include a specific activity, song, image, a friend's contact information, or place to journal. Eventually, the app will have the ability to track moods and activities to help users learn more about themselves.

## Purpose
Object Oriented Programing principles, Restful Routing, Test Driven Development, Behavior Driven Development, Authenticated API calls, OAuth process

## Welcome Page Demo

![PenPal Welcome Page Demo](https://user-images.githubusercontent.com/50811220/72157621-4ac66c80-33b0-11ea-8105-67699afd1607.gif)

## Installation
1. Clone down this and the micro-service repo into a directory of your choice
```
  $ git clone https://github.com/Not-Zorro/penpal
  $ git clone https://github.com/Not-Zorro/penpal_api
```
2. Change into the following directory
```
  $ cd penpal_api
```
3. Install the gem packages
```
  $ bundle install
```
4. Change into the other directory
```
  $ cd penpal
```
5. Install the gem packages
```
  $ bundle install
```
6. Set up the database
```
  $ rake db:{create,migrate,seed}
```
7. Run redis-server
```
  $ redis-cli
```
8. In a separate terminal tab, run the sidekiq process
```
  $ bundle exec sidekiq
```
9. In a third terminal tab, launch your local server
```
  $ rails s
```
10. Finally, visit `http://localhost:3000` in your web browser

## Requirements
Environment variables and required API keys/tokens:
* Google Token defined as `ENV['GOOGLE_TEST_TOKEN']`
* Google client_id defined as `ENV['GOOGLE_CLIENT_ID']`
* Google client_secret defined as `ENV['GOOGLE_CLIENT_SECRET']`
* Spotify client_id defined as `ENV['SPOTIFY_CLIENT_ID']`
* Spotify client_secret defined as `ENV['SPOTIFY_CLIENT_SECRET']`
* Spotify Access Token defined as `ENV['SPOTIFY_ACCESS_TOKEN']`
* Spotify Refresh Token defined as `ENV['SPOTIFY_REFRESH']`
* Pexel API key defined as `ENV['PEXEL_API_KEY']` within `penpal_api`
* Whitelisted Spotify Redirect URI defined as `ENV['SPOTIFY_REDIRECT_URI']`
* Penpal micro-service URL defined as `ENV['PENPAL_URL']`

## Database / Schema Diagram

<img width="947" alt="Screen Shot 2020-01-09 at 8 30 49 PM" src="https://user-images.githubusercontent.com/50811220/72127545-f39ca980-3367-11ea-8ee6-aa78902a7dec.png">

## Testing

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

### Running Tests
Run the full test suite:
```
$ bundle exec rspec
```

Run a single test file:
```
$ bundle exec rspec <path-to-file>
```

## Versions
- Ruby 2.5.0
- Rails 5.2.4
