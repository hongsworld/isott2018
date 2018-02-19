class AddDegreeToRegistration < ActiveRecord::Migration[5.1]
  def change
    add_column :registrations, :degree, :string
  end
end
