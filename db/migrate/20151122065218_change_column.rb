class ChangeColumn < ActiveRecord::Migration
  def change
    change_column :room, :location, :integer
  end
end
