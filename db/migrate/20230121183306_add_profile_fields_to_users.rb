class AddProfileFieldsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :fname, :string
    add_column :users, :lname, :string
    add_column :users, :phone, :string
    add_column :users, :birth_date, :date
    add_column :users, :veteran_status, :string
    add_column :users, :home_buying_status, :string
    add_column :users, :race, :string
    add_column :users, :address1, :string
    add_column :users, :address2, :string
    add_column :users, :city, :string
    add_column :users, :zipcode, :string

    add_column :users, :employment_status, :string
    add_column :users, :income, :string
    add_column :users, :debt_to_income, :string
    add_column :users, :credit_score, :string

    add_column :users, :when, :string
    add_column :users, :house_type, :string
    add_column :users, :budget, :string
    add_column :users, :where, :string

    add_column :users, :avatar, :string

    add_column :users, :inactive, :string
  end
end
