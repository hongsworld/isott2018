class AddInstitution2ToRegistration < ActiveRecord::Migration[5.1]
  def change
    add_column :registrations, :institution2, :string
  end
end
