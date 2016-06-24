class CreateTechtalks < ActiveRecord::Migration
  def change
    create_table :techtalks do |t|
      t.string :name
      t.string :description
      t.string :tags

      t.timestamps null: false
    end
  end
end
