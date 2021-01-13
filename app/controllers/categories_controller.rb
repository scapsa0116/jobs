class CategoriesController < ApplicationController

#     def index
#         @categories = Category.search(params[:search])
#         # @categories = Category.all.includes(:jobs)
#         # binding.pry
#     #     @job = Job.find_by_id(params[:job_id])
#     # if @job
#     #     @categories = @job.categories
#     # else
#     #     redirect_to categories_path
#     # end
       
#     end
  

#   def new 
#     # @job = Job.find_by_id(params[:job_id])
#     # @category = @job.categories.build
#   end 

#   def create 
#     @category = Categories.new(category_params)
#       if @category.save
#       redirect_to categories_path
#       else
#        render :new
#       end

#   end

#   def show
#     @job = Job.find_by_id(params[:job_id])
#       if @job
#     @categories = @job.categories
#   else
#     redirect_to jobs_path
# end
# @category = Category.find_by_id(params[:id])
# end


#   private
#   def category_params
#     params.require(:category).permit(:name, :job_id, :user_id)
#   end
# end




def index
  
  @categories = Category.all.includes(:jobs)
end

def show
   @category = Category.find_by_id(params[:id])
end

def new
end

end
