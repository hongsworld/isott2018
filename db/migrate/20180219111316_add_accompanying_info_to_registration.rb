class AddAccompanyingInfoToRegistration < ActiveRecord::Migration[5.1]
  def change
    add_column :registrations, :accompanying_info, :text
  end
end
