require "spec_helper"

describe Listing do
  it "should not allow two listings with the same URL" do
    Listing.create(:title => "test", :url => "test")
    Listing.create(:title => "test", :url => "test")

    Listing.count.should == 1
  end
end
