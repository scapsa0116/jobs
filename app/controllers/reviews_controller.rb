class ReviewsController < ApplicationController
    before_action :check_for_logged_in, only: [:new, :create, :edit, :update]

def index
    @job = Job.find_by_id(params[:job_id])
    if @job
        @reviews = @job.reviews
    else
        redirect_to jobs_path
    end

    def new 
        @job = Job.find_by_id(params[:job_id])
        @review = @job.reviews.build
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