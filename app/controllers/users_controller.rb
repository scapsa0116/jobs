class UsersController < ApplicationController


    #loading sign up form
    def new
        @user = User.new
        
     end
 
     # post Sign Up
     def create
         @user = User.new(user_params)
         
         if @user.valid?
            @user.save
            session[:user_id] = @user.id
            redirect_to categories_path
         else
             render :new
         end
     end
 
     
     def show
        @user = User.find_by(id: params[:id])
        redirect_to user_path(current_user) if @user != current_user
     end
 

     
     private
 
     def user_params
         params.require(:user).permit(:firstName, :lastName, :email, :password)
     end
 
 end

