class User < ActiveRecord::Base
  has_many :posts
  has_many :comments, through: :posts
  mount_uploader :image, ImageUploader

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
