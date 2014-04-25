class User < ActiveRecord::Base
  has_many :posts
  has_many :comments, through: :posts
  mount_uploader :image, ImageUploader

  validates :bio, presence: true
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :bootcamp, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  def full_name
    "#{first_name} #{last_name}"
  end

end
