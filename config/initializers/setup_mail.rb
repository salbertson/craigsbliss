ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "gmail.com",
  :user_name            => "craigsblissapp",
  :password             => "PBv4iugTPw7VTr",
  :authentication       => "plain",
  :enable_starttls_auto => true
}
