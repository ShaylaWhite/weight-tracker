

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "secret"
    register Sinatra::Flash
  end

  get "/" do
    erb :welcome
  end

end
