ActsAsToken.configure do |code|
  code.length            = 10
  code.use_chars         = :alpha_numeric
  code.include_chars     = Array.new
  code.invalid_chars     = Array.new
  code.valid_chars       = Array.new
  code.repeat_chars      = true
end
