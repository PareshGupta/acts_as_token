require 'spec_helper'

describe ActsAsToken::Generator do

  describe '#initialise' do
    let(:config) { ActsAsToken.configurations[:default] }
    let(:generator) { ActsAsToken::Generator.new(config, 'User', :auth_token) }

    pending 'should initialize the object' do
      expect(generator.token_config).to eq ''
      expect(generator.model_name).to eq ''
      expect(generator.field).to eq ''
    end
  end

end