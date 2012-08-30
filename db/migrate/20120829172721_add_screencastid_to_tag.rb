class AddScreencastidToTag < ActiveRecord::Migration
  def change
    add_column :tags, :screencast_id, :integer
  end
end
