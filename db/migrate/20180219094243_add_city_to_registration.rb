class AddCityToRegistration < ActiveRecord::Migration[5.1]
  def change
    add_column :registrations, :city, :string
  end
end
