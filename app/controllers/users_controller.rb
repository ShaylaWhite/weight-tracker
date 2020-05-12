class UsersController < ApplicationController 

    get '/login' do
        erb :'/users/login'
    end


    post '/login' do
        @user = User.find_by(email: params[:email])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            #flash[:success] = "#{@user.email}, Successfully Logged In"

            redirect to "/users/#{@user.id}"
        else
            #flash.now[:danger] = "Incorrect User/Password. Please login again!"
            redirect '/login'
        end
    end
        
    get '/logout' do
        session.clear
        redirect '/'
    end

    get '/signup' do
    erb :"/users/signup"
    end

    #persits user here with name,email,pw
    post '/users' do
      user = User.create(params)

        #flash.now[:success] = "You are now Signed Up, Please login!
        redirect to "/users/#{user.id}"
    end 
        

    get '/users/:id' do
        @user = User.find_by(id:params[:id])
        @stat = Stat.find_by(id:params[:id])

        erb :'/users/show'
    end 
end 