class User < ApplicationRecord

  # Allow registrations by setting
  # Control.first.registrations_enabled = true; Control.first.save!
  # Yes its clunky

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
 
  has_many :posts
  has_many :comments
  has_many :replies

  acts_as_voter
  
  validates :username, length: { in: 2..15 }
  validates_presence_of :username
  validates :bio, length: { maximum: 10000 }


end
