module ActsAsToken

  class UniquenessValidator

    def self.valid_token?(_token, model_name, field)
      token_array = model_name.constantize.pluck(field)
      token_array.all? { |token| _token != token }
    end

  end

end
