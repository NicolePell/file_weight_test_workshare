require 'rest_client'

class User

  attr_reader :base_url, :api_key
  attr_accessor :response

  def initialize
    @base_url = 'https://my.workshare.com/api/open-v1.0/'
    @api_key =  '22b3e990-bb92'
  end

  def login(email, password)
    RestClient.post("#{base_url}/user_sessions.json",{'user_session[email]' => email, 'user_session[password]' => password, 'device[app_uid]' => api_key}) do |response, request, result|
      self.response = response
    end
  end

end
