class AddInstitution1ToRegistration < ActiveRecord::Migration[5.1]
  def change
    add_column :registrations, :institution1, :string
  end
end
