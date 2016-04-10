class Vote < ActiveRecord::Base
  belongs_to :post, counter_cache: true
  belongs_to :user

  # validates :user_id, uniqueness: {
  #   scope: :post_id,
  #   message: "has already voted"
  # }
end
