class DeleteCategoryIdFromCategories < ActiveRecord::Migration[6.0]
  def change
    remove_column :categories, :job_id
    remove_column :categories, :user_id
  end
end
