module ActsAsToken

  class Generator

    attr_reader :token_config

    def self.generate(config)
      new(config).generate_token
    end

    def initialize(config)
      @token_config = config
    end

    def generate_token
      random_string
    end

    private

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

  end

end
