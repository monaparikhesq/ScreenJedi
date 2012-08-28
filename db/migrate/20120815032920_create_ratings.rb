class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.string :opinion
      t.integer :user_id
      t.integer :screencast_id

      t.timestamps
    end
  end
end
