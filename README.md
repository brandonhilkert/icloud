# Icloud

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/icloud`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

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

```ruby

c = RubyiCloud::Client.new
c.authorize(APPLEID, PASSWORD)
udid = c.backup_devices.content.udids.first
last_backup = c.backup_device(udid).content.backup.sort {|a,b| b.timestamp2 <=> a.timestamp2 }.first
backup_id = last_backup.index
files = c.backup_files(udid, backup_id)
sms_db = files.content.find { |f| f.path.include?("sms.db") }
c.get_file(udid, backup_id, Array(sms_db))
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/icloud.

