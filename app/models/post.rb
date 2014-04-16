class Post < ActiveRecord::Base
  validates :user_id, presence: true
  validates :content, presence: true
  has_many :comments
  belongs_to :user


end
