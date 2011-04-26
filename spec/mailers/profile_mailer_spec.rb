require "spec_helper"

describe ProfileMailer do
  describe "with picture listing" do
    before(:each) do
      @listings = [Listing.new(:title => "Free Firewood", :url => "http://google.com", :image => "image.jpg")]
    end

    it "should signify an image exists in the email" do
      ProfileMailer.new_listing_email(@listings).deliver
      mailer = ActionMailer::Base.deliveries.last
      mailer.body.should include("Free Firewood (pic)")
    end
  end
end
