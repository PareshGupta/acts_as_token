module ActsAsToken

  class Generator

    attr_reader :token_config, :model_name, :field

    def initialize(config, model_name, field)
      @token_config = config
      @model_name   = model_name
      @field        = field 
    end

    def generate_token
      begin
        _token = random_string
      end until unique_token?(_token)
      _token
    end

    def unique_token?(_token)
      token_array = model_name.constantize.pluck(field)
      token_array.all? { |token| _token != token }
    end

    def random_string
      chars = token_config.valid_characters.dup
      if token_config.repeat_chars
        token_config.length.times.map { chars.sample }.join
      else
        randomized_array(chars).join
      end
    end

    def randomized_array(chars)
      token_config.length.times.map do
        character = chars.sample
        chars.delete(character)
        character
      end
    end

    def self.generate(config, model_name, field)
      token_generator = new(config, model_name, field)
      token_generator.generate_token
    end
  end
end
