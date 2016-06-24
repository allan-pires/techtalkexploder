class AddColumnsToTechtalk < ActiveRecord::Migration
  def change
    add_column :techtalks, :title, :string
    add_column :techtalks, :type, :string
  end
end
