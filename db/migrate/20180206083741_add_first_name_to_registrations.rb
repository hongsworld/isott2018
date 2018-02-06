class AddFirstNameToRegistrations < ActiveRecord::Migration[5.1]
  def change
    add_column :registrations, :first_name, :string
    add_column :registrations, :last_name, :string
    add_column :registrations, :institution, :string
    add_column :registrations, :email, :string
    add_column :registrations, :country, :string
    add_column :registrations, :presentation_type, :string
    add_column :registrations, :pay_type, :string
    add_column :registrations, :address, :string
  end
end
