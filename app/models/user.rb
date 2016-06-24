class User < ActiveRecord::Base
  has_one :goole_oauth_credential
  
  has_secure_password
end
