class Post < ActiveRecord::Base
  has_many :votes, dependent: :destroy

  validates :title, presence: true
end
