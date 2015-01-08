require 'spec_helper'
require 'user_session'

describe User do
  let(:user) { User.new }

  context 'logging in' do
    it 'when user details are valid' do
      user.login('pellicena@gmail.com', 'makersmake2014')
      expect(user.response.code).to eq 201
    end

    xit 'should hold the session token' do
      user.login('pellicena@gmail.com', 'makersmake2014')
      expect(user.session["device_credentials"]).not_to be_empty
      expect(user.session["device_credentials"]).not_to be_empty
    end
  end
end
