class AddPhoneToRegistration < ActiveRecord::Migration[5.1]
  def change
    add_column :registrations, :phone, :string
  end
end
