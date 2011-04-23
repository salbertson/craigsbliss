class ProfileMailer < ActionMailer::Base
  default :from => "from@example.com"

  def new_listing_email(listings)
    @listings = listings
    mail(:to => "scott.onix@gmail.com", :subject => "New Craigslist Posts")
  end
end
