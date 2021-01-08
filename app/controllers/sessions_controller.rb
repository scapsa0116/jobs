class SessionsController < ApplicationController

    def home
    
    end

    def new
      @user = User.new
    end

    def create
        
        user = User.find_by(username: params[:user][:email])
        if user && user.authenticate(params[:user][:password])
           session[:user_id] = user.id 
           redirect_to user_path(user)
        else
           flash[:message] = "incorrect username or password"
           redirect_to '/login'
        end
     end 
     
    def destroy
        session.clear
        redirect_to '/'
    end
end 