class Comment < ActiveRecord::Base
  belongs_to :post
  attr_accessible :author_name, :comment_content
  validates :author_name,  :presence => true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates :comment_content, :presence => true, :length => { :minimum => 5 }
end
