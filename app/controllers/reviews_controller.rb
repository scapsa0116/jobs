class ReviewsController < ApplicationController
    # before_action :set_job
    before_action :set_review, only: [:show, :edit, :update, :destroy]

    def index
        if @job = Job.find_by_id(params[:job_id])
            @review = @job.reviews.build
          else
            @review = Review.new
          end
    end


    def show 
        # if @review.user_id == current_user.id
        #     render 'show'
        # else
        #     redirect_to job_path(@job)
        # end
        @review = Review.find_by_id(params[:id])
    end


    def new
        if @job = Job.find_by_id(params[:job_id])
            @review = @job.reviews.build
          else
            @review = Review.new
          end
    end

    def edit 
        if @review.user_id == current_user.id
            render 'edit'
        else
            redirect_to job_path(@job)
        end
    end

#     def create
#   #binding.pry
#         @review = Review.create(review_params)
#         @review.user_id = current_user.id
#         @review.job_id = @job.id
#         @review.save
#         if @review.save
#             redirect_to @job, notice: 'Review was successfully created.'
#         else
#             render 'new'
#         end
#     end


# def create

#     @job = Job.find(params[:job_id])
#     @review = @job.reviews.new(review_params)
#     @review.user_id = current_user.id
#     @review.save
#     if @review.save
#       redirect_to job_reviews_path(@mjob), notice: "Thanks for your review"
#     else
#       render :new
#     end
#   end


    def create 
        # binding.pry
        @review = current_user.reviews.build(review_params)
        if @review.save
          redirect_to review_path(@review)
        else
          render :new
        end
    end

    def update 
        @review.update(review_params)
    end

    def destroy 
        @review.destroy
    end

    private
    def review_params
        params.require(:review).permit(:description, :job_id, :user_id)
    end

    def set_review
        @review = Review.find(params[:id])
    end

    def set_job
        @job = Job.find(params[:job_id])
    end
      
end