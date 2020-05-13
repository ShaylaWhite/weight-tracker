class StatsController < ApplicationController 
  
    get '/stats/new' do
        if !Helpers.is_logged_in?(session)
          redirect '/'
        end
        erb :'stats/new'
    end
    post '/stats' do
        stat = Stat.create(params)
        user = Helpers.current_user(session)
        stat.user = user
        stat.save
        redirect to "/users/#{user.id}"
      end

      get '/stats/:id' do
        if !Helpers.is_logged_in?(session)
          redirect '/'
        end
        @stats = Stat.find_by(id: params[:id])
        if !@Stat
          redirect to '/'
        end
        erb :'stats/show'
      end




      get '/stats/:id/edit' do
        @stat = Stat.find_by(id: params[:id])
      if !Helpers.is_logged_in?(session) || !@stat || @stat.user != Helpers.current_user(session)
        redirect '/'
      end
      erb :'/stats/edit'
    end
  

end
