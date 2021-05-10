class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  acts_as_votable

  validates_presence_of :url, :headline, :user_id
 
  validates :url, url: true
  validates :body, length: { maximum: 10000 }
end
