
# Hometime Reservations API

Hometime Reservations API is a web application that processes booking payloads from Airbnb and Booking.com to create and update reservations.

## Requirements

* Ruby 3.1.3
* Ruby on Rails 7
* SQLite3

## Installation

1. Install `ruby-install` and `chruby`. Follow the instructions in the [ruby-install README](https://github.com/postmodern/ruby-install#readme) and the [chruby README](https://github.com/postmodern/chruby#readme).

2. Install Ruby:

   ```sh
   ruby-install ruby 3.1.3
   chruby 3.1.3
   ```

3. Install bundler

    ```sh
    gem install bundler
    bundle install
    ```

4. Create and migrate the database

    ```sh
    rails db:create db:migrate
    ```


## Usage

1. Start the server

    ```sh
    rails server
    ```


2. Testing
    
    ```sh
    bundle exec rspec
    ```

## API Testing with Postman

  [Postman Collection](https://www.postman.com/red-astronaut-244279/workspace/hometime-reservations-api/collection/1763749-3f381eef-1221-4f40-a349-58d5de927a73?ctx=documentation)