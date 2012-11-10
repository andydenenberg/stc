class Post < ActiveRecord::Base
  attr_accessible :body, :title, :user_id
  has_many :comments
  has_one :user
  has_many :attachments
  
end
