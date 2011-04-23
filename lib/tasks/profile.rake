namespace :profile do
  task :email_new_listings => :environment do
    Profile.all.each do |profile|
      profile.email_new_listings
    end
  end
end
