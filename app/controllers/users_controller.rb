class UsersController < ApplicationController 
end
get '/login' do
    erb :login
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
   erb :signup
end

#persits user here with name,email,pw
post '/users' do
    @user = User.new
    @user.email = params[:email]
    @user.password = params[:password]
    @user.name = params[:name]

    if @user.save
     #flash.now[:success] = "You are now Signed Up, Please login!
      redirect '/login'
    else
     #flash.now[:danger] = "Sorry Something Went Wrong Sign Up Again"
        erb :signup
    end
  end

get '/users/:id' do
    @user = User.find_by(id:params[:id])
    @stat = Stat.find_by(id:params[:id])

    erb :'/users/show'
end 




end 