require "spec_helper"

describe ProfileMailer do
  before(:each) do
    @profile = Profile.create(:name => "Firewood", :phrase => "firewood", :category => "zzz")
    @listing = @profile.listings.build(:title => "Free Firewood", :url => "http://google.com")
  end

  it "should include profile name in email" do
    ProfileMailer.new_listing_email([@listing]).deliver
    mailer = ActionMailer::Base.deliveries.last
    mailer.body.should include("New Firewood Posts")
  end

  describe "with picture listing" do
    before(:each) do
      @listing.image = "image.jpg"
    end

    it "should signify an image exists in the email" do
      ProfileMailer.new_listing_email([@listing]).deliver
      mailer = ActionMailer::Base.deliveries.last
      mailer.body.should include("Free Firewood (pic)")
    end
  end
end
