class Tag < ActiveRecord::Base
  attr_accessible :keyword, :screencast_id
  
  has_many :taggings
  belongs_to :screencast
  
  # gsub(" ","").split(",")
  
  def make_tags
     gsub(" ","").split(",")
  end

end
