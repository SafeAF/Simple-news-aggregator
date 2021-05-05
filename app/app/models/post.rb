class Post < ApplicationRecord
  belongs_to :user
  has_many :comments

  validates_presence_of :url, :headline, :user_id
 
  validates :url, url: true
  validates :body, length: { maximum: 10000 }
end
