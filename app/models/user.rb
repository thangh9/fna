class User < ActiveRecord::Base
  has_secure_password
  
  #validate email, username
  validates :email, uniqueness: true, presence: true, format: { with: /^[\w.+-]+@([\w]+.)+\w+$/ }

  #confirm email 
  devise :database_authenticatable, :confirmable
  attr_accessible :email, :password, :password_confirmation, :username

  create_table :users do |t|
  	t.database_authenticatable
  	t.confirmable
  end
end
