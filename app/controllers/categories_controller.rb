class CategoriesController < ApplicationController


def index
  
  @categories = Category.all.includes(:jobs)
end

def show
   @category = Category.find_by_id(params[:id])
end

def new
end


def create 
 
  @category = current_user.categories.build(category_params)
  binding.pry
  if @category.save
   
    redirect_to category_path(@category)
  else
    render :new
  end
end


  private
  def category_params
    params.require(:category).permit(:name, :job_id, :user_id)
  end
end



