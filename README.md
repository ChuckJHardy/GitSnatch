[![Code Climate](https://codeclimate.com/github/ChuckJHardy/GitSnatch.png)](https://codeclimate.com/github/ChuckJHardy/GitSnatch)

# GitSnatch

Grab a files content from a github commit sha. Simple and lightweight.

## Installation

Add this line to your application's Gemfile:

    gem 'git_snatch', '~> 0.0.1', group :development

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install git_snatch

## Usage

    GitSnatch.configure do |config|
      config.endpoint = 'https://github.company.com/organisation'
      config.username = 'git-snatch-user'
      config.password = 81ysnaks7HFHS619sn
    end
    
    GitSnatch.within('21c5f27a6997c4888056ae7d95dd193893378492').grab('user_controller.rb')
    # => class UserController < ApplicationController...
    
## Configuration

* `endpoint` sets the base uri for github. Perfect for enterprise users. `https://github.com/user`

Required for private or enterpise repo's.

* `username` sets the username for authentication.
* `password` sets the password for authentication.

## Requirements

* ruby > 1.9.x

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
