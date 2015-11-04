class AddHobbiesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :hobbies, :text
  end
end
