class AddDateToTechtalks < ActiveRecord::Migration
  def change
  	add_column :techtalks, :date, :date
  end
end
