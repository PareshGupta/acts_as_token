module ActsAsToken

  class Configuration

    attr_accessor :length, :use_chars, :include_chars, :invalid_chars, :valid_chars, :repeat_chars

    def valid_characters
      @valid_chars.empty? ? get_valid_chars_array : @valid_chars
    end

    def get_valid_chars_array
      _all_chars = get_chars_array
      _all_chars += @include_chars unless @include_chars.empty?
      _invalid_chars = get_invalid_chars_array
      _all_chars - _invalid_chars
    end

    def get_chars_array
      case @use_chars.to_s
      when 'lower_alpha' then ActsAsToken::LOWER_ALPHA
      when 'upper_alpha' then ActsAsToken::UPPER_ALPHA
      when 'numeric' then ActsAsToken::NUMERIC
      when 'alpha' then ActsAsToken::ALPHA
      when 'lower_alpha_numeirc' then ActsAsToken::LOWER_ALPHA_NUMERIC
      when 'upper_alpha_numeric' then ActsAsToken::UPPER_ALPHA_NUMERIC
      when 'alpha_numeric' then ActsAsToken::ALPHA_NUMERIC
      end
    end

    def get_invalid_chars_array
      @invalid_chars.empty? ? Array.new : @invalid_chars
    end

  end

end
