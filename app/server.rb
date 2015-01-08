require 'sinatra'
require 'sinatra/partial'
require 'rack-flash'


require './lib/user_session'

enable :sessions
set :session_secret, 'super secret'
set :partial_template_engine, :erb

use Rack::Flash

get '/' do
  session[:email], session[:password] = nil

  erb :index
end

post '/files' do
  email = params["email"]
  password = params["password"]

  user = User.new

  user.login(email, password)

  if user.response.code == 201
    session[:email] = email
    session[:password] = password
    flash[:notice] = "You have successfully signed in"
    redirect to '/files'
  else
    flash[:errors] = "The user details you entered are not registered"
    redirect to '/'
  end
end

get '/files' do
  email = session[:email]
  password = session[:password]

  user = User.new

  user.login(email, password)

  @email = email

  erb :files
end
