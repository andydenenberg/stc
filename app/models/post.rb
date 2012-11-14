class Post < ActiveRecord::Base
  attr_accessible :body, :title, :user_id, :type_is
  has_many :comments
  has_one :user
  has_many :attachments
  
  def file_count(kind)
        
    count = 0
    stash = [ ]
    case kind
    when 'image'
      self.attachments.each do |fn|
        if !fn.image_content_type.nil? and fn.image_content_type.include?('image')
          count =+ 1
          stash.push fn
        end
      end        
    when 'file'
      self.attachments.each do |fn|
        if !fn.image_content_type.nil? and !fn.image_content_type.include?('image')
          count =+ 1
          stash.push fn
        end
      end      
    when 'url'
      self.attachments.each do |attach|
        if attach.image_file_name.nil?
          count =+ 1
          stash.push attach
        end
      end      
    end
    
    return count, stash      	    
  end
  
end
