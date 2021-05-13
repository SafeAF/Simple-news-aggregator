class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  acts_as_votable

  validates_presence_of :url, :headline, :user_id
 
  validates :url, url: true
  validates :body, length: { maximum: 10000 }

  before_create :set_domain

  private

  def set_domain
  	require 'domainator'
  	self.domain = Domainator.parse(self.url)
  end
end
