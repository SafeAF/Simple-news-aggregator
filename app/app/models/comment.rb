class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  has_many :replies, dependent: :destroy

  acts_as_votable
  has_rich_text :content
  
  #validates_presence_of :body
  validates :body, length: { maximum: 1000 }
end
