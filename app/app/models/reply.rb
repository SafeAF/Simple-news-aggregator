class Reply < ApplicationRecord
  belongs_to :comment
  belongs_to :user

  acts_as_votable
  
  validates_presence_of :body #, :comment_id, :user_id
  validates :body, length: { maximum: 1000 }
end
