class AddRoomToMessage < ActiveRecord::Migration
  def change
    add_reference :messages, :room, index: true, foreign_key: true
  end
end
