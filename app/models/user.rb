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

  has_many :follower_relationships, class_name: "Relationship", foreign_key: "followed_id"
  has_many :followed_relationships, class_name: "Relationship", foreign_key: "follower_id"

  has_many :followers, through: :follower_relationships
  has_many :followeds, through: :followed_relationships
  
  def following? user
    self.followeds.include? user
  end
  
  def follow user
    Relationship.create follower_id: self.id, followed_id: user.id
  end
  
end
