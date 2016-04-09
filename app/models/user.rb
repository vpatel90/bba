class User < ActiveRecord::Base

  has_many :tracked_joints ,dependent: :destroy
  has_many :posts
  has_many :votes
  has_many :interests, through: :tracked_joints, source: :post, as: :interests

  has_secure_password

  validates :name, presence: true
  validates :email, presence: true
  validates :password_digest, presence: true


end
