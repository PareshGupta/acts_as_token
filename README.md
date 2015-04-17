# ActsAsToken
<a href="https://codeclimate.com/github/PareshGupta/acts_as_token"><img src="https://codeclimate.com/github/PareshGupta/acts_as_token/badges/gpa.svg" /></a>

Easily create randomly unique tokens for the rails application.

## Installation

Add this line to your Gemfile:

    gem 'acts_as_token', '~> 0.1'

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

  You can even specify the option 'type' which loads the configuration from the 'config/initializers/acts_as_token.rb'.

  In your model...

    class User < ActiveRecord::Base

      acts_as_token :auth_token, type: :user

    end

  In your config/initializers/acts_as_token.rb file...

    ActsAsToken.configure :user do
      code.length            = 12                # sets the length of the token
      code.use_chars         = :numeric          # sets the type of the token
      code.include_chars     = ['$', '%']        # use these characters as well(does not ignore :use_chars).
      code.invalid_chars     = [0, 2, 4]         # do not use these characters.
      code.valid_chars       = [ 3, 4, 5, 6 ]    # use only these characters (ignores :use_chars).
      code.repeat_chars      = false             # characters should be repeated.
    end

  other options for use_chars:-
  => :alpha (a-Z)
  => :lower_alpha (a-z)
  => :upper_alpha (A-Z)
  => :numeric (0-9)
  => :lower_alpha_numeric (a-z, 0-9)
  => :upper_alpha_numeric (A-Z, 0-9)
  => :alpha_numeric (a-Z, 0-9)

  Note:- When no option 'type' is specified, it loads the default configuration.

## Configuration

  When there is no 'acts_as_token.rb' configuration file in the application, it loads the default configuration file.

    ActsAsToken.configure do |code|
      code.length            = 10                  # sets the length of the token
      code.use_chars         = :alpha_numeric      # sets the type of the token
      code.include_chars     = []                  # use these characters as well(does not ignore :use_chars).
      code.invalid_chars     = []                  # do not use these characters.
      code.valid_chars       = []                  # use only these characters (ignores :use_chars).
      code.repeat_chars      = true                # characters should be repeated.
    end

## Contribution

  1) Fork it
  2) Create your feature branch (git checkout -b my-new-feature)
  3) Commit your changes (git commit -am 'Add some feature')
  4) Push to the branch (git push origin my-new-feature)
  5) Create new Pull Request




