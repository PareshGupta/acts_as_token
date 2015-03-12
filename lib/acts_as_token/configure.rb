module ActsAsToken

  LOWER_ALPHA         = ('a'..'z').to_a
  UPPER_ALPHA         = ('A'..'Z').to_a
  NUMERIC             = (0..9).to_a
  ALPHA               = LOWER_ALPHA + UPPER_ALPHA
  LOWER_ALPHA_NUMERIC = LOWER_ALPHA + NUMERIC
  UPPER_ALPHA_NUMERic = UPPER_ALPHA + NUMERIC
  ALPHA_NUMERIC       = ALPHA + NUMERIC

  mattr_accessor :configurations
  @@configurations = {}

  class << self

    def configure(field = 'default')
      config = configurations[:default].try(:dup) || Configuration.new
      yield config
      configurations[field.to_sym] = config
    end

  end

end
