class RemoveOpinion < ActiveRecord::Migration
  def change
    remove_column :ratings, :opinion
  end
end
