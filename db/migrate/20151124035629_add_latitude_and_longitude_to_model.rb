class AddLatitudeAndLongitudeToRooms < ActiveRecord::Migration
  def change
    add_column :rooms, :longitude, :float
    add_column :rooms, :latitude, :float
  end
end
