class AddAddress1ToRegistration < ActiveRecord::Migration[5.1]
  def change
    add_column :registrations, :address1, :string
  end
end
