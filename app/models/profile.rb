class Profile < ActiveRecord::Base
  has_many :listings

  validates_presence_of :name, :phrase, :category

  def email_new_listings
    craigslist = Craigslist.new
    results = craigslist.search(phrase, category)

    new_listings = []
    results.each do |result|
      listing = listings.new(result)
      new_listings << listing if listing.save
    end

    ProfileMailer.new_listing_email(new_listings).deliver if new_listings.present?
  end
end
