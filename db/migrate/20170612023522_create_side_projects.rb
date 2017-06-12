class CreateSideProjects < ActiveRecord::Migration[5.0]
  def change
    create_table :side_projects do |t|
      t.string :street
      t.string :city
      t.integer :zip
      t.string :state
      t.string :beds
      t.integer :baths
      t.integer :sq__ft
      t.string :type
      t.datetime :sale_date
      t.integer :price
      t.decimal :latitude
      t.decimal :longitude

      t.timestamps
    end
  end
end
