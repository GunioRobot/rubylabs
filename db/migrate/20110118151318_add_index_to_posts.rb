class AddIndexToPosts < ActiveRecord::Migration
  def self.up
    add_index :posts, :user_id
    add_index :posts, :category_id
  end

  def self.down
  end
end
