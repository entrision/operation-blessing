class AddPrayerAndLocationToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :prayer, :text
    add_column :photos, :location, :string
    add_column :photos, :for_date, :date
  end
end
