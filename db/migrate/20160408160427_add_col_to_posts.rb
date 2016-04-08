class AddColToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :location, :string
    add_reference :posts, :user, index: true, foreign_key: true
  end
end
