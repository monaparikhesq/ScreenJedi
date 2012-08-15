class CreateScreencasts < ActiveRecord::Migration
  def change
    create_table :screencasts do |t|
      t.string :title
      t.text :description
      t.integer :length
      t.string :embed

      t.timestamps
    end
  end
end
