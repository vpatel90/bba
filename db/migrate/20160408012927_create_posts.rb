class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title, null:false
      t.string :description
      t.string :pic
      t.integer :votes_count

      t.timestamps null: false
    end
  end
end
