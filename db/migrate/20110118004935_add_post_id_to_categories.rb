class AddPostIdToCategories < ActiveRecord::Migration
  def self.up
    add_column :categories, :post_id, :integer
  end

  def self.down
    remove_column :categories, :post_id
  end
end
