class User < ActiveRecord::Base

  has_many :tracked_joints
  has_many :posts
  has_many :votes

  validates :name, presence: true
  validates :email, presence: true
  validates :password_digest, presence: true

end
