class ReviewsController < ApplicationController
    before_action :check_for_logged_in, only: [:new, :create, :edit, :update]

def index
    @job = Job.find_by_id(params[:job_id])
    if @job
        @reviews = @job.reviews
    else
        redirect_to jobs_path
    end
end

def new
    if params[:job_id] && @job = Job.find(params[:job_id])
        @review = @job.review.build 
        
    else
        @error = "this job service doesn't exist" if params[:job_id]
        @review = Review.new
    end
end

    def create
        @job = Job.find_by_id(params[:job_id])
        @review = current_user.reviews.build(review_params)
        @review.job = @job
        if @review.save
            redirect_to job_path(@review.job)
        else

            render :new
        end
    end

    private
    def review_params
        params.require(:review).permit(:description)
end













end