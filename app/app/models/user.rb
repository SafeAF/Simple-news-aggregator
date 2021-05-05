class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
 validates :username, length: { in: 2..15 }
  validates_presence_of :username
  validates :bio, length: { maximum: 10000 }
  has_many :posts
  has_many :comments
  has_many :replies
end
