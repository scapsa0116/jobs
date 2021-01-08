class AddIdToTheCategories < ActiveRecord::Migration[6.0]
  def change
    add_column :categories, :user_id, :integer
    add_column :categories, :job_id, :integer
  end
end
