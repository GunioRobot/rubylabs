class AddFieldsToPosts < ActiveRecord::Migration
  def self.up
   # add_column :posts, :user_id, :integer
    add_column :posts, :category_id, :integer
  end

  def self.down
    remove_column :posts, :category_id
   # remove_column :posts, :user_id
  end
end
