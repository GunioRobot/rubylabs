# == Schema Information
# Schema version: 20110116235939
#
# Table name: posts
#
#  id          :integer(4)      not null, primary key
#  title       :string(255)
#  body        :text
#  published   :boolean(1)
#  created_at  :datetime
#  updated_at  :datetime
#  user_id     :integer(4)
#  category_id :integer(4)
#

class Post < ActiveRecord::Base
  
  attr_accessible :title, :body, :published
  
 validates_presence_of :title, :body, :published
  
  belongs_to :user
  belongs_to :category
  
  
  def category_attributes=(category_attributes)
    category_attributes.each do |attributes|
      category.build(attribues)
    end
  end
  
  
  def self.per_page
    5
  end
    
end
