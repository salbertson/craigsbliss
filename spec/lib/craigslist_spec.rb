require "spec_helper"

describe Craigslist do
  describe "#search" do
    before(:each) do
      stub_request(:get, Craigslist::BASE_URL + "firewood").to_return(:body => File.read("spec/data/craigslist.html"))
    end

    it "should return results" do
      results = Craigslist.new.search("firewood")
      results.size.should == 4
      results.first[:title].should == "FREE Firewood -"
      results.first[:url].should == "http://sacramento.craigslist.org/zip/2339871636.html"
    end
  end
end
