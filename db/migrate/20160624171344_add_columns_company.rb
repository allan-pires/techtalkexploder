class AddColumnsCompany < ActiveRecord::Migration
  def change
    add_column :techtalks, :company_name, :string
    add_column :techtalks, :url, :string
    add_column :techtalks, :company_email, :string
    add_column :techtalks, :token, :string
  end
end
