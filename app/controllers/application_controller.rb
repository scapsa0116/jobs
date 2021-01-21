class ApplicationController < ActionController::Base

    helper_method [:current_user, :logged_in?, :require_login]
    private

    def current_user
        current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
    end

    def logged_in?
        # !current_user.nil?
        !!session[:user_id]
    end

    def redirect_if_not_logged_in
        redirect_to '/' if !logged_in?
    end


    def current_user
        @current_user ||= User.find_by_id(session[:user_id])
      end
    
      #checks if user is logged in
      def logged_in?
        !!session[:user_id]
      end
    
      #creates before action
      def require_login
        unless logged_in?
          flash[:error] = "You must be logged in to access this section"
          redirect_to login_path # halts request cycle
        end
      end

    
end


