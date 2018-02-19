class AddZipCodeToRegistration < ActiveRecord::Migration[5.1]
  def change
    add_column :registrations, :zip_code, :string
  end
end
