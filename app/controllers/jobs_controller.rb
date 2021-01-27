class JobsController < ApplicationController
    

#   def search 
#     if params[:search].present?
#       @jobs = Job.search(((params[:search].present? ? params[:search] : '*')).records, load: true)
#     else
#       @jobs = Job.all
#   end
# end


  def index 
    if params[:category_id]
      category= Category.find(params[:category_id])
      @jobs = category.jobs
      @reviews= Review.all
    else
      @jobs = Job.includes(:category, :user)
    end
  end
  

  def new
    @job = Job.new
    @job.build_category 
  end



    def create
    # binding.pry
     @job = Job.new(job_params)
      @job.user_id = session[:user_id]
      if @job.save
      redirect_to job_path(@job), notice: "Job profile was successfully created."
      else
        @job.build_category
       render :new
      end
  end 


    def edit
        @job = Job.find_by_id(params[:id])
        redirect_to jobs_path if !@job || @job.user != current_user
        @job.build_category if !@job.category
    end
    
    def update
      @job = Job.find_by_id(params[:id])
         redirect_to jobs_path if !@job || @job.user != current_user
        if @job.update(job_params)
          redirect_to job_path(@job), notice: "Job was successfully"
        else
          render :edit
        end
    end

    def show 
     @reviews = Review.all
     @category = Category.all
    # @reviews = Review.where(job_id: @job.id)
      @job = Job.find_by_id(params[:id])
      redirect_to jobs_path if !@job
    end
  

    def destroy
      @job = Job.find(params[:id])
      @job.destroy
      redirect_to job_path(@job)
    end

    

    private

    def job_params
        params.require(:job).permit(:title, :service, :phone, :email, :adress, :user_id, :category_id, :image, category_attributes: [:name] )
    end
end
