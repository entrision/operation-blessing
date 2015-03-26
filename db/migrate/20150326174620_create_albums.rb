class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.text :description
      t.text :email_description
      t.string :location
      t.date :for_date


      t.timestamps null: false
    end
  end
end
