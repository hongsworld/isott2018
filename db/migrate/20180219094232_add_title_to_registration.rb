class AddTitleToRegistration < ActiveRecord::Migration[5.1]
  def change
    add_column :registrations, :title, :string
  end
end
