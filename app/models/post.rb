class Post < ActiveRecord::Base
  
  attr_accessible :title, :body
  
 
  
  belongs_to :user
  
  
  def self.per_page
    5
  end
    
end
