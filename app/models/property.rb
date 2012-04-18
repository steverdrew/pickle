class Property < ActiveRecord::Base
  attr_accessible :name, :tagline
  
  validates_presence_of :name, :on => :create
  
end
