class Listing < ActiveRecord::Base
  belongs_to :profile

  validates_uniqueness_of :url
end
