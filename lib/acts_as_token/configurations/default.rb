ActsAsToken.configure do |code|
  code.length            = 10                   # sets the length of the token
  code.use_chars         = :alpha_numeric       # sets the type of the token
  code.include_chars     = Array.new            # use these characters as well(does not ignore :use_chars). (default: none)
  code.invalid_chars     = Array.new            # do not use these characters. (default: none)
  code.valid_chars       = Array.new            # use only these characters (ignores :use_chars). (default: none)
  code.repeat_chars      = true                 # characters should be repeated. (default: true)
end
