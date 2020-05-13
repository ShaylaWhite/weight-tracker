class UsersController < ApplicationController 

    get '/login' do
        erb :'/users/login'
    end


    post '/login' do
        user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            #flash[:success] = "#{@user.email}, Successfully Logged In"

            redirect to "/users/#{user.id}"
        else
            #flash.now[:danger] = "Incorrect User/Password. Please login again!"
            redirect '/login'
        end
    end
        

    get '/signup' do
    erb :"/users/signup"
    end

    #persits user here with name,email,pw
    post '/signup' do
        @user = User.create(params)
        if @user.valid?
            binding.pry
          session[:user_id] = @user.id
          redirect to "/users/#{@user.id}"
        else
          redirect to '/signup'
        end
      end


    get '/users/:id' do
        
        if User.find_by(id: params[:id]) 
            @user = User.find_by(id:params[:id])
            @stats = @user.stats
        else 
           redirect to '/'
        end 
            erb :'users/show'
         end 
         
         get '/logout' do
            session.clear
            redirect '/'
        end
    

    end 

