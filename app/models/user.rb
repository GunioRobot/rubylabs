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

  attr_accessible :name, :email, :password, :password_confirmation, :admin
  
  attr_accessor :password
      
  before_save :encrypt_password
  
   
  validates_presence_of :name
  validates_confirmation_of :password
  validates_presence_of :password, :on => :create

   email_regex =  /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  
  validates :name, :presence => true, :length => {:minimum => 4,  :maximum => 50 } 
  validates :email, :format => { :with => email_regex, :on => :create },
                                 :uniqueness => {:case_sensitive => false}
 
  validates :password, :presence => true,  :confirmation => true,
                      :length => { :within => 6..40}
  
  has_many :posts, :dependent => :destroy
  has_many :categories, :through => :posts
  
  
  private
  
  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
  
  debugger
  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
     user
    else
      nil
    end
  end
  
  def self.per_page
    10
  end
  
end
