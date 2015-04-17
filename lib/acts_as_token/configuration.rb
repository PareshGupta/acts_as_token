module ActsAsToken

  class Configuration

    attr_accessor :length, :use_chars, :include_chars, :invalid_chars, :valid_chars, :repeat_chars
    attr_reader :all_chars

    def valid_characters
      valid_chars.blank? ? get_valid_chars_array : valid_chars
    end

    def get_valid_chars_array
      build_valid_chars_array
    end

    def build_valid_chars_array
      get_chars_array
      include_special_chars_to_array
      exclude_invalid_chars_array
    end

    def get_chars_array
      @all_chars = "ActsAsToken::#{use_chars.upcase.to_s}".constantize
    end

    def include_special_chars_to_array
      @all_chars += include_chars unless include_chars.blank?
    end

    def exclude_invalid_chars_array
      @all_chars -= invalid_chars unless invalid_chars.blank?
    end

  end

end
