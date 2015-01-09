require 'rest_client'
require 'json'

class User

  attr_reader :base_url, :api_key
  attr_accessor :response, :file_list

  def initialize
    @base_url = 'https://my.workshare.com/api/open-v1.0/'
    @api_key =  '22b3e990-bb92'
  end

  def login(email, password)
    RestClient.post("#{base_url}/user_sessions.json",{'user_session[email]' => email, 'user_session[password]' => password, 'device[app_uid]' => api_key}) do |response, request, result|
      self.response = response
    end
  end

  def session
    response.cookies
  end

  def list_files
    workshare_response = RestClient.get("#{base_url}/files.json", { cookies: session, 'limit' => 100000 })
    self.file_list = JSON.parse(workshare_response)["files"]
  end

end
