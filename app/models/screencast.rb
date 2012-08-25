class Screencast < ActiveRecord::Base
  attr_accessible :description, :embed, :length, :title, :company_id
  
  has_many :notes
  has_many :ratings
  has_many :tags, :through => :taggings
  has_many :taggings
  has_many :subscriptions
  belongs_to :company

  # mount_uploader :video, VideoUploader
    
  

end
