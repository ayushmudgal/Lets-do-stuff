class AddDetailsToMessages < ActiveRecord::Migration
  def change
    add_column :messages, :content, :text
  end
end
