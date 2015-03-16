module ActsAsToken

  module Tokenify

    extend ActiveSupport::Concern

    module ClassMethods

      def acts_as_token(field, options = {})
        config = get_valid_configuration(options)

        before_save do |record|
          if record[field].blank?
            begin
              token = ActsAsToken::Generator.generate(config)
            end until ActsAsToken::UniquenessValidator.valid_token?(token, self.class.to_s, field)

            record[field] = token
          end
        end
      end

      def get_valid_configuration(options)
        if options[:type]
          config = ActsAsToken.configurations[options[:type].to_sym]
        else
          config = ActsAsToken.configurations[:default]
        end
      end

    end

  end

end
