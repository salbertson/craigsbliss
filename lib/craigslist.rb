class Craigslist
  BASE_URL = "http://sacramento.craigslist.org/search/zip?srchType=A&minAsk=&maxAsk=&query="

  def search(phrase)
    uri = URI.parse(BASE_URL + phrase)
    doc = Nokogiri::HTML(Net::HTTP.get(uri))

    listings = []
    doc.css("p.row").each do |row|
      listing = {}
      listing[:title] = row.css("a").first.content
      listing[:url] = row.css("a").first["href"]
      listings << listing
    end

    listings
  end
end
