[![Code Climate](https://codeclimate.com/github/ChuckJHardy/GitSnatch.png)](https://codeclimate.com/github/ChuckJHardy/GitSnatch)

# GitSnatch

Grab content from a file with a github commit sha. Simple and lightweight.

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
    
    repo = 'ContinuusLenimentus'
    sha = '21c5f27a6997c4888056ae7d95dd193893378492'
    
    GitSnatch.within(repo, sha).grab('app/controllers/user_controller.rb')
    # => class UserController < ApplicationController...
    
## Configuration

Github Public

    GitSnatch.configure do |config|
      config.username = 'ChuckJHardy'
    end
    
Github Private

    GitSnatch.configure do |config|
      config.username = 'ChuckJHardy'
      config.password = 81ysnaks7HFHS619sn
    end
    
Github Enterprise

    GitSnatch.configure do |config|
      config.endpoint = 'https://github.company.com/organisation'
      config.username = 'git-snatch-user'
      config.password = 81ysnaks7HFHS619sn
    end

Required for all.

* `username` sets the username for the account.

Required for private or enterpise repo's.

* `password` sets the password for authentication.

Required for enterpise accounts.

* `endpoint` sets the base uri for github. Perfect for enterprise users. `https://raw.github.com`


## Requirements

* ruby > 1.9.x
* curl > 0.8.x

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
