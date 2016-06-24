Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, "901684903828-fuv4vighfmp6rrs16gepcphtq6cfhqsj.apps.googleusercontent.com", "tmnTdaioFjD_BsQiQa6q2evz",
  {
      :scope => "email, profile, calendar"
    }
  # provider :google_oauth2, ENV["GOOGLE_CLIENT_ID"], ENV["GOOGLE_CLIENT_SECRET"]
end
