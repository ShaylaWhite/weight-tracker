class StatsController < ApplicationController 
  
    get '/stats/new' do
        if !Helpers.is_logged_in?(session)
          redirect '/'
        end
        erb :'stats/new'
    end
end
