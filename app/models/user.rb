class User < ActiveRecord::Base
  has_many :google_oauth_credential

  has_secure_password
end
