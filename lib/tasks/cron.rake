desc "This task is called by the Heroku cron add-on"
task :cron => :environment do
  puts "Searching for new listings..."
  Profile.all.each do |profile|
    profile.email_new_listings
  end
  puts "done."
end
