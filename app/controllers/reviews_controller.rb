class ReviewsController < ApplicationController

    before_action :redirect_if_not_logged_in
    before_action :set_review, only: [:show, :edit, :update]
    before_action :redirect_if_not_review_author, only: [:edit, :update]
    before_action :check_for_logged_in, only: [:new, :create, :edit, :update]

def index
    # @job = Job.find_by_id(params[:job_id])
    # if @job
    #     @reviews = @job.reviews
    # else
    #     redirect_to jobs_path
    # end

    if params[:job_id] && @job = Job.find_by_id(params[:job_id])
        @reviews = @job.reviews
     else
       @error = "That post doesn't exist" if params[:job_id]
       @reviews = Review.all
     end
end

def new
    if params[:job_id] && @job = Job.find_by_id(params[:job_id])
        @review = @job.reviews.build
    else
        @review = Review.new
    # if params[:job_id] && @job = Job.find_by_id(params[:job_id])
    #     @review = @job.reviews.build 
        
    # else
    #     # @error = "this job service doesn't exist" if params[:job_id]
    #     @review = Review.new
    # end
    end
end

    def create
        # @job = Job.find_by_id(params[:job_id])
        @review = current_user.reviews.build(review_params)
        # @review.job = @job
        if @review.save
            redirect_to reviews_path
        else

            render :new
        end
    end


    def show 
        if @review.update(review_params)
            redirect_to review_path(review)
        else
            render :edit
        end
    end


    def update 
    end

    private
    def review_params
        params.require(:review).permit(:description, @job, @user)
    end

    def set_review
        @review = Review.find_by(id: params[:id])
        if !@review
          flash[:message] = "Review was not found"
          redirect_to reviews_path
        end
      end
    
      def redirect_if_not_review_author
         redirect_to reviews_path if @review.user != current_user
      end
end