class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  has_many :replies

  validates_presence_of :body, :user_id, :post_id
  validates :body, length: { maximum: 1000 }
end
