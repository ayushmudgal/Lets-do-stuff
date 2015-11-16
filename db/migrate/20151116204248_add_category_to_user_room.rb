class AddCategoryToUserRoom < ActiveRecord::Migration
  def change
    add_reference :user_rooms, :category, index: true, foreign_key: true
  end
end
