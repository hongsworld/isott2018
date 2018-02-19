class AddAcademicTitleToRegistration < ActiveRecord::Migration[5.1]
  def change
    add_column :registrations, :academic_title, :string
  end
end
