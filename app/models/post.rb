class Post < ActiveRecord::Base
  has_many :votes, dependent: :destroy, counter_cache: true

  validates :title, presence: true
end
