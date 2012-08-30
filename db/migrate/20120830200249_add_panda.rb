class AddPanda < ActiveRecord::Migration
  def change
    add_column :screencasts, :panda_video_id, :string
  end

end
