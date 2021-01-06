class JobsController < ApplicationController
    


    def index
      if params[:user_id] && @user = User.find_by_id(params[:user_id])
        @jobs = @user.jobs
     else
       @error = "That user doesn't exist" if params[:user_id]
       @jobs = Job.includes(:category, :user)
     end
 
     @jobs = @jobs.filter(params[:job][:category_id]) if params[:job] && params[:job][:category_id] != ""
 
   end


    def new
    if params[:user_id] && @user = User.find_by_id(params[:user_id])
        @job = @user.jobs.build
        else
        @job = Job.new
    end
        
    end 


    def create
        @job = current_user.jobs.build(job_params)
        #binding.pry
        if @job.save
        redirect_to jobs_path
        else
         render :new
        end
    end 
    

    def edit
        @job = Job.find_by_id(params[:id])
        redirect_to jobs_path if !@job || @job.user != current_user
        @job.build_category if !@job.category
    end
    
    def update
         @job = Job.find_by_id(id: params[:id])
         redirect_to jobs_path if !@job || @job.user != current_user
        if @job.update(job_params)
          redirect_to job_path(@job)
        else
          render :edit
        end
    end

    def show 
        
        @job = Job.find_by_id(params[:id])
        redirect_to jobs_path if !@job
    end

    private

    def job_params
        params.require(:job).permit(:title, :service, :phone, :email)
    end
end
