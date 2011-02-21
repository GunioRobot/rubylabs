class RemovePostIdFromCategories < ActiveRecord::Migration
  def self.up
    remove_column :categories, :post_id
  end

  def self.down
    add_column :categories, :post_id, :integer
  end
end
