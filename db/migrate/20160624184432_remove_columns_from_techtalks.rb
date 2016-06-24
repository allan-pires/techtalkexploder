class RemoveColumnsFromTechtalks < ActiveRecord::Migration
  def change
  	remove_column :techtalks, :name
  end
end
