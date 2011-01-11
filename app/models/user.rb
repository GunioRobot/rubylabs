# == Schema Information
# Schema version: 20110111150113
#
# Table name: users
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base

  attr_accessible :name, :email
  
  email_regex =  /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  
  validates :name, :presence => true, :length => {:minimum => 4,  :maximum => 50 } 
  validates :email, :format => { :with => email_regex, :on => :create },
                                 :uniqueness => {:case_sensitive => false}
  
end
