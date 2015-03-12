require "acts_as_token/tokenify"

class ActiveRecord::Base
  
  include ::ActsAsToken::Tokenify
   
end