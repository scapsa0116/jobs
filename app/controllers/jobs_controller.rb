class JobsController < ApplicationController

    def new
        if params[:user_id] && @user = User.find_by_id(params[:user_id])
            @job = @user.jobs.build
        else
            @job = Job.new
        end
        
    end 
    
    
    
    
    
    
    
    def show 
    end 
end
