class User < ApplicationRecord
  rolify
  has_many :rent_posts
  
  has_many :followee_follows, foreign_key: :follower_id, class_name: "Follow"
  has_many :followees, through: :followee_follows, source: :followee
  
  has_many :follower_follows, foreign_key: :followee_id, class_name: "Follow"
  has_many :followers, through: :follower_follows, source: :follower
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  after_create :assign_default_role
         
  def assign_default_role
    add_role(:CRSmember)
  end
  
  def toggle_follow(user)
    if self.followers.include?(user)
      self.followers.delete(user)
    else
      self.followers.push(user)
    end
  end
end
