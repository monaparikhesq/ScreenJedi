class Screencast < ActiveRecord::Base
  attr_accessible :description, :embed, :length, :title, :company_id, :video
  
  has_many :notes
  has_many :ratings
  has_many :tags
  has_many :subscriptions
  belongs_to :company

  mount_uploader :video, VideoUploader

  # config.cache_classes = true

  # config.cache_classes = false
  # config.reload_classes_only_on_change = false
  
  def avg_rating
    stars_array = []
    ratings.each do |rating|
      stars_array << rating.stars
    end
    return stars_array.inject{ |sum, el| sum + el }.to_f / stars_array.size
  end
  

end
