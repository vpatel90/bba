class User < ActiveRecord::Base

  validates :name, presence: true
  validates :email, presence: true
  validates :password_digest, presence: true

end
