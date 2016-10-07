# RedisCodeCov

Would you like to know how much of your Rails app code in production is actually getting used?  And how often?  When we run our tests we can use code coverage metrics (like https://github.com/colszowka/simplecov) to see which parts of our code are not tested.  

This can be a great tool to see which parts of your code are used often and perhaps need to be improved for performance or test coverage.  Also, you can see which parts of your code are not exercised and perhaps those features can be removed.  

Warning - this is ALPHA quality software, be careful before running it in production.  It will increment a Redis counter for EACH method call.  Depeneding on your traffic it could slow down your application.  

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'redis_code_cov'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install redis_code_cov

## Usage

After install run `rails g redis_code_cov:install`.  Configure the gem in `config/initializers/redis_code_cov.rb`

In your ApplicationController (or another controller) add:
```ruby
include RedisCodeCov::Controller
```

Data will be stored in Redis DB and namespace configured in the initializer.  

TODO:

write more tests

Track method calls in:
helpers
jobs
mailers
models
views

For other gems:
active model serializers
draper decorators
pundit policies

Should there be a default TTL for Redis records?  It will help get rid of long tail of methods that are infrequently used.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/redis_code_cov. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
