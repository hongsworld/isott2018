class AddBankTransferToRegistrations < ActiveRecord::Migration[5.1]
  def change
    add_column :registrations, :bank_transfer, :boolean
  end
end
