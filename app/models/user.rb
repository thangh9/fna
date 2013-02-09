class User < ActiveRecord::Base
  has_secure_password
  
  #validate email, username
  validates :email, uniqueness: true, presence: true, format: { with: /^[\w.+-]+@([\w]+.)+\w+$/ }
  validates :username, uniqueness: true, presence: true
  #validate password
  validates :password, :presence => true,
                       :confirmation => true,
                       :length => {:within => 6..40},
                       :on => :create
  validates :password, :confirmation => true,
                       :length => {:within => 6..40},
                       :allow_blank => false,
                       :on => :update
  attr_accessible :email, :password, :password_confirmation, :username, :gender
end
