class Comment < ActiveRecord::Base
  validates :body, presence: :true
  validates :user_id, presence: true

  belongs_to :post
  # has_many :users, through: :posts
end
