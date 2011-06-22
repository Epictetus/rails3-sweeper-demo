class AddUserIdToWidgets < ActiveRecord::Migration
  def self.up
    add_column :widgets, :user_id, :integer
  end

  def self.down
    remove_column :widgets, :user_id
  end
end
