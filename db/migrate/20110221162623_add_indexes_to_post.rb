class AddIndexesToPost < ActiveRecord::Migration
  def self.up
   # add_index :posts, :user_id
    add_index :posts, :category_id
  end

  def self.down
  #  remove_index :posts, :user_id
    remove_index :posts, :category_id
  end
end
