require "spec_helper"

describe Profile do
  describe "#email_new_listings" do
    before(:each) do
      stub_request(:get, Craigslist::BASE_URL + "firewood").to_return(:body => File.read("spec/data/craigslist.html"))

      @profile = Profile.create(:name => "Firewood Test", :phrase => "firewood")
    end

    it "should create listings" do
      lambda { @profile.email_new_listings }.should change(Listing, :count).by(4)
    end

    it "should send a new listing email" do
      @profile.email_new_listings
      email = ActionMailer::Base.deliveries.last
      email.should be_present
      @profile.listings.each do |listing|
        email.body.should include(listing.title)
        email.body.should include(listing.url)
      end
    end

    describe "with saved listings" do
      before(:each) do
        @profile.listings.create(:title => "FREE Firewood -", :url => "http://sacramento.craigslist.org/zip/2339871636.html")
      end

      it "should not email old listings" do
        @profile.email_new_listings
        email = ActionMailer::Base.deliveries.last
        email.should be_present
        email.body.should_not include(@profile.listings.first.title)
        email.body.should_not include(@profile.listings.first.url)
      end
    end

    describe "with no new listings" do
      before(:each) do
        @profile.email_new_listings
      end

      it "should not send email" do
        lambda { @profile.email_new_listings }.should_not change(ActionMailer::Base.deliveries, :count)
      end
    end
  end
end
