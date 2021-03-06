# Icloud

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/icloud`. To experiment with that code, run `bin/console` for an interactive prompt.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'icloud'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install icloud

## Usage

### Authentication

```ruby
c = Icloud::Client.new
c.authorize(APPLEID, PASSWORD)
```

If the Apple ID/Password combo is bad, an `Icloud::Client::UnauthorizedError`
will be raised.


### Backup info

```ruby
udids = c.udids
last_backup = c.latest_backup(udids.first)
backup_id = last_backup.index
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/icloud.

