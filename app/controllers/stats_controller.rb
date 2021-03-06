class StatsController < ApplicationController 

    get '/stats' do
      if !Helpers.is_logged_in?(session)
        redirect '/'
      end
        @stats = Stat.all
        erb :'stats/index' 
     
    end
  
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
        @stat = Stat.find_by(id: params[:id])
        if !@stat
          redirect to '/'
        end
        erb :'/stats/show'
      end
    
    
      get '/stats/:id/edit' do
          @stat = Stat.find_by(id: params[:id])
        if !Helpers.is_logged_in?(session) || !@stat || @stat.user != Helpers.current_user(session)
          redirect '/'
        end
        erb :'/stats/edit'
      end
    
      patch '/stats/:id' do
        stat = Stat.find_by(id: params[:id])
        if stat && stat.user == Helpers.current_user(session)
          stat.update(params[:stat])
          redirect to "/stats/#{stat.id}"
        else
          redirect to "/stats"
        end
      end
    
      delete '/stats/:id/delete' do
        stat = Stat.find_by(id: params[:id])
        if stat && stat.user == Helpers.current_user(session)
          stat.destroy
        end
        flash[:message] = "***Your stat is now deleted**"
        redirect to '/'
       end
      
  end