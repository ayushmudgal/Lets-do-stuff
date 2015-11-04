class AddDetailsToRooms < ActiveRecord::Migration
  def change
    add_column :rooms, :description, :text
    add_column :rooms, :date, :date
    add_column :rooms, :time, :time
    add_column :rooms, :location, :string
    add_column :rooms, :private, :boolean
  end
end
