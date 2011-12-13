require "spec_helper"

describe Craigslist do
  describe "#search" do
    before(:each) do
      stub_request(:get, Craigslist::BASE_URL + "blahh?srchType=A&minAsk=&maxAsk=&query=firewood").to_return(:body => File.read("spec/data/craigslist.html"))
    end

    it "should return results" do
      results = Craigslist.new.search("firewood", "blahh")
      results.size.should == 4
      results.first[:title].should == "FREE Firewood -"
      results.first[:url].should == "http://sacramento.craigslist.org/zip/2339871636.html"
    end

    it "should return image filename if one exists" do
      results = Craigslist.new.search("firewood", "blahh")
      results.first[:image].should == "3nc3od3pa5Z15U25S2b4p4fd19499febf1532.jpg"
    end

    describe "with multi-word search phrase" do
      before(:each) do
        stub_request(:get, Craigslist::BASE_URL + "blahh?srchType=A&minAsk=&maxAsk=&query=firewood+trailer").to_return(:body => File.read("spec/data/craigslist.html"))
      end

      it "should return results" do
        results = Craigslist.new.search("firewood trailer", "blahh")
        results.size.should == 4
      end
    end
  end
end
