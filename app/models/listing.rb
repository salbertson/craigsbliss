class Listing < ActiveRecord::Base
  validates_uniqueness_of :url
end
