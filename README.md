# ActsAsToken

Easily create randomly unique tokens for the rails application.

## Installation

Add this line to your Gemfile:

  gem 'acts_as_token', '~> 0.0.1'

then execute the following command:

  $ bundle install

You can even install manually by following command:

  $ gem install acts_as_token

## Usage

Really simple:

  Add to the model where you want to generate a token with the token field name

    class User < ActiveRecord::Base

      acts_as_token :auth_token

    end

  You can even specify the configuration type. When no option 'type' is specified, it takes the default configuration.

## Configuration

  Add your own configurations to the /config/initializer/acts_as_token.rb:

    ActsAsToken.configure :user do |code|
      code.length            = 12                # sets the length of the token
      code.use_chars         = :numeric          # sets the type of the token
      code.include_chars     = ['$', '%']        # use these characters as well(does not ignore :use_chars). (default: none)
      code.invalid_chars     = [0, 2, 4]         # do not use these characters. (default: none)
      code.valid_chars       = [ 3, 4, 5, 6 ]    # use only these characters (ignores :use_chars). (default: none)
      code.repeat_chars      = false              # characters should be repeated. (default: true)
    end

  and then to the model add:

    class User < ActiveRecord::Base

      acts_as_token :auth_token, type: :user

    end

  You can use :alpha (a-Z), :lower_alpha (a-z), :upper_alpha (A-Z), :numeric (0-9), :lower_alpha_numeric (a-z, 0-9), :upper_alpha_numeric (A-Z, 0-9), :alpha_numeric (a-Z, 0-9) as various token types. Default is :alpha_numeric.

