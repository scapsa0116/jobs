class AddRecruiterIdToJobs < ActiveRecord::Migration[6.0]
  def change
    add_column :jobs, :recruiter_id, :integer
  end
end
