class Post < ApplicationRecord
  belongs_to :user
  has_many :comments

  validates_presence_of :url, :headline, :user_id
  validates :username, length: { in: 2..15 }
  validates :url, url: true
  validates :body, length: { maximum: 10000 }
end
