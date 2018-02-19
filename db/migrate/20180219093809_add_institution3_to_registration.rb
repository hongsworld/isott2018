class AddInstitution3ToRegistration < ActiveRecord::Migration[5.1]
  def change
    add_column :registrations, :institution3, :string
  end
end
