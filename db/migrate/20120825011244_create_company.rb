class CreateCompany < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name

      t.timestamps
  	end
    create_table :memberships do |t|
      t.integer :company_id
      t.integer	:user_id

      t.timestamps 
    end
  end
end
