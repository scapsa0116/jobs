class AddUserIdToTheJobs < ActiveRecord::Migration[6.0]
  def change
    add_column :jobs, :category_id, :integer
  end
end
