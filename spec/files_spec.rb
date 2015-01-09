require 'spec_helper'

require 'files'
require 'user_session'

describe Files do
  let(:user) { User.new }
  let(:files) { Files.new }

  before do
    user.login('pellicena@gmail.com', 'makersmake2014')
    user.list_files
    list = user.file_list
    files.process(list)
  end

  it 'lists files with details in a hash' do
    expect(files.files).to eq [{name: "Acceptance Testing in Ruby with Cucumber", ext: "mp4", size: 0},
      {name: "Bern", ext: "", size: 0},
      {name: "workshare", ext: "txt", size: 0},
      {name: "Inceptions", ext: "pdf", size: 0},
      {name: "workshare", ext: "jpg", size: 0} ]
    end

    it 'has a list of videos' do
      expect(files.videos).to eq [ {name: "Acceptance Testing in Ruby with Cucumber", ext: "mp4", size: 0} ]
    end

    it 'has a list of text files' do
      expect(files.text).to eq [ {name: "Bern", ext: "txt", size: 0},
      {name: "workshare", ext: "txt", size: 0} ]
    end

    it 'has a list of other files' do
      expect(files.other).to eq [ {name: "Inceptions", ext: "pdf", size: 0},
      {name: "workshare", ext: "jpg", size: 0} ]
    end

end
