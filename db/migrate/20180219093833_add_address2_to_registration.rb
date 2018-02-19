class AddAddress2ToRegistration < ActiveRecord::Migration[5.1]
  def change
    add_column :registrations, :address2, :string
  end
end
