class AddCategoryToRoom < ActiveRecord::Migration
  def change
    add_reference :rooms, :category, index: true, foreign_key: true
  end
end
