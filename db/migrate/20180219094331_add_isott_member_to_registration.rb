class AddIsottMemberToRegistration < ActiveRecord::Migration[5.1]
  def change
    add_column :registrations, :isott_member, :string
  end
end
