class Craigslist
  BASE_URL = "http://sacramento.craigslist.org/search/"

  def search(phrase, category)
    uri = URI.parse(BASE_URL + category + "?srchType=A&minAsk=&maxAsk=&query=" + phrase)
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
