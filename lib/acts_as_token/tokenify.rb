module ActsAsToken
  module Tokenify
    extend ActiveSupport::Concern

    module ClassMethods
      def acts_as_token(field, options = {})
        if options[:type]
          config_object = ActsAsToken.configurations[options[:type].to_sym]
        else
          config_object = ActsAsToken.configurations[:default]
        end

        before_save do |record|
          if record[field].blank?

            token = ActsAsToken::Generator.generate(config_object, self.class.to_s, field)
            record[field] = token
          end
        end
      
      end

      def get_model_name
        self.class.to_s
      end

    end

  end
end
