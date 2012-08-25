class AddCompany < ActiveRecord::Migration
  def change
    add_column :screencasts, :company_id, :integer
  end
end
