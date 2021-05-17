class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  acts_as_votable
  has_rich_text :content
  
  validates_presence_of :url, :headline, :user_id, :body, :content
  validates :url, url: true
  validates :body, length: { maximum: 10000 }

  before_create :set_domain

  private

  def set_domain
  	require 'domainator'
  	self.domain = Domainator.parse(self.url)
  end
end
