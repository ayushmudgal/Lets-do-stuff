class AddCreatorIdToRoom < ActiveRecord::Migration
  def change
    add_column :rooms, :creator_id, :integer
  end
end
