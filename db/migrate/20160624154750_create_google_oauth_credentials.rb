class CreateGoogleOauthCredentials < ActiveRecord::Migration
  def change
    create_table :google_oauth_credentials do |t|
      t.integer :user_id
      t.string :token
    end
  end
end
