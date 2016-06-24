class AddImageToGoogleOauthCredential < ActiveRecord::Migration
  def change
    add_column :google_oauth_credentials, :image, :string
  end
end
