module ActsAsToken

  module Tokenify

    extend ActiveSupport::Concern

    module ClassMethods

      def acts_as_token(field, options = {})
        config = ActsAsToken.configurations[options[:type].try(:to_sym) || :default]

        before_save do |record|
          if record[field].blank?
            begin
              token = ActsAsToken::Generator.generate(config)
            end until ActsAsToken::UniquenessValidator.valid_token?(token, self.class.to_s, field)

            record[field] = token
          end
        end
      end

    end

  end

end
