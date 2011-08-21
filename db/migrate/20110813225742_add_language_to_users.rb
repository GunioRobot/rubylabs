class AddLanguageToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :language, :string, :null => false
  end

  def self.down
    remove_column :users, :language
  end
end
