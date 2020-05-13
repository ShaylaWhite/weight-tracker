class UsersController < ApplicationController 

    get '/users' do
        if Helpers.is_logged_in?(session)
          @users = User.all
        else
          redirect to '/'
        end
        erb :'users/index'
     end

    get '/login' do
        if Helpers.is_logged_in?(session)
            user = Helpers.current_user(session)
            redirect to "/users/#{user.id}"
        end 
            erb :'/users/login'
    end

    get '/signup' do
        if Helpers.is_logged_in?(session)
            user = Helpers.current_user(session)
            redirect to "/users/#{user.id}"
        end 
        erb :"/users/signup"
    end

    post '/login' do
        user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            #flash[:success] = "#{@user.email}, Successfully Logged In"

            redirect to "/users/#{user.id}"
        else
            #flash.now[:danger] = "Incorrect User/Password. Please login again!"
            redirect '/signup'
        end
    end
        
    post '/signup' do
        if user = User.create(params)
            session[:user_id] = user.id
            redirect to "/users/#{user.id}"
        end
             redirect to '/signup'
    end

 
    #persits user here with name,email,pw
  

    get '/users/:id' do
        
        if Helpers.is_logged_in?(session) && User.find_by(id: params[:id]) 
            @user = User.find_by(id:params[:id])
            @stats = @user.stats
        else
            redirect to '/'
          end
          erb :'users/show'
        end
      
        get '/logout' do
          session.clear
          redirect to '/'
        end
      
      end

