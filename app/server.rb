require 'sinatra'
require './lib/user_session'

get '/' do
  
  erb :index
end

post '/files' do
  email = params["email"]
  password = params["password"]

  user = User.new

  user.login(email, password)
end
