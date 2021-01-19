class UsersController < ApplicationController
    before_action :authorize_user

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
        authorize_user
        @user_jobs = @user.jobs
     end
 

     
     private
 
     def user_params
         params.require(:user).permit(:firstName, :lastName, :email, :password)
     end

     def authorize_user
        @user = User.find(params[:id])
        redirect_to root_url unless current_user == @user
     end
 
 end

