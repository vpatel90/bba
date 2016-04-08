class Post < ActiveRecord::Base
  has_many :votes, dependent: :destroy
  has_many :tracked_joints

  validates :title, presence: true
end
