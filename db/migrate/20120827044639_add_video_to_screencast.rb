class AddVideoToScreencast < ActiveRecord::Migration
  def change
    add_column :screencasts, :video, :string
    remove_column :screencasts, :video_string
  end
end
