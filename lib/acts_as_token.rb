require "acts_as_token/configure"
require "acts_as_token/configuration"
require "acts_as_token/generator"
require "acts_as_token/uniqueness_validator"

require "acts_as_token/default"

require "acts_as_token/orms/active_record"    if defined? ::ActiveRecord