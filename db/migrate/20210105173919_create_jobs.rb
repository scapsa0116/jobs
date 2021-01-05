class CreateJobs < ActiveRecord::Migration[6.0]
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :service
      t.string :category_id
      t.string :city_id
      t.string :adress
      t.string :phone
      t.string :email
      t.string :photo
      t.integer :user_id

      t.timestamps
    end
  end
end
