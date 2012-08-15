class Screencast < ActiveRecord::Base
  attr_accessible :description, :embed, :length, :title
end
