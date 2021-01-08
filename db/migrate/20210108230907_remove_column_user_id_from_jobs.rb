class RemoveColumnUserIdFromJobs < ActiveRecord::Migration[6.0]
  def change
    remove_column :jobs, :category_id
  end
end
