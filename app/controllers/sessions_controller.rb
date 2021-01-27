class SessionsController < ApplicationController
    # skip_before_action :require_login
    
    def home
    
    end

    def new
      @user = User.new
      render :login
    end

    def create
        
        @user = User.find_by(email: params[:user][:email])
        if @user && @user.authenticate(params[:user][:password])
           session[:user_id] = @user.id 
        redirect_to categories_path
        else
            redirect_to '/login'
        end
     end 



     def omniauth
      @user = User.from_omniauth(auth)
      if @user.valid?
        
      @user.save
      session[:user_id] = @user.id
      redirect_to categories_path
       else
      redirect_to root_path
         end
     end
     
    def destroy
        session.clear
        redirect_to '/'
    end


    private

  def auth
    request.env['omniauth.auth']
  end
end 






 
    