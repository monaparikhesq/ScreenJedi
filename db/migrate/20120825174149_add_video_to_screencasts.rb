class AddVideoToScreencasts < ActiveRecord::Migration
  def change
    add_column :screencasts, :video_string, :string
  end
end
