require 'spec_helper'
require 'user_session'

describe User do

  let(:user) { User.new }

  context 'logging in' do
    it 'when user details are valid' do
      user.login('pellicena@gmail.com', 'makersmake2014')

      expect(user.response.code).to eq 201
    end

    it 'should hold the session token' do
      user.login('pellicena@gmail.com', 'makersmake2014')
      expect(user.session["device_credentials"]).not_to be_empty
      expect(user.session["device_credentials"]).not_to be_empty
    end
  end

  context 'when logged in' do
    it 'should display a list of files' do
      user.login('pellicena@gmail.com', 'makersmake2014')
      user.list_files
      expect(user.file_list.count).to eq 5
    end
  end
end
