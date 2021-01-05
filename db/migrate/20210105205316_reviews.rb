class Reviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.string :description

      t.timestamps
    end
  end
end
