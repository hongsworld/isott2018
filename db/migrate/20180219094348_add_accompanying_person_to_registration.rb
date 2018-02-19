class AddAccompanyingPersonToRegistration < ActiveRecord::Migration[5.1]
  def change
    add_column :registrations, :accompanying_person, :string
  end
end
