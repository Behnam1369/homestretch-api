class AddFirstUpdateDateFieldToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :first_update_date, :date
  end
end
