class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.date :start_datetime
      t.date :end_datetime
      t.boolean :is_all_day
      t.string :memo
      
      t.timestamps
    end
  end
end
