class Rating < ActiveRecord::Base
  attr_accessible :opinion, :screencast_id, :user_id, :stars
  
  belongs_to :screencast
  belongs_to :user
  
  validates :stars, :numericality => { :only_integer => true }
  validates :stars, :numericality => { :greater_than_or_equal_to => 1,
                                       :less_than_or_equal_to => 5}
end
