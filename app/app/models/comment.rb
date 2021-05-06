class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  has_many :replies

  acts_as_votable
  
  validates_presence_of :body
  validates :body, length: { maximum: 1000 }
end
