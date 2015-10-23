class CreateUserInfos < ActiveRecord::Migration
  def change
    create_table :user_infos do |t|
      t.string :name
      t.integer :age
      t.string :location
      t.string :hobbies
      t.string :about_me

      t.timestamps null: false
    end
  end
end
