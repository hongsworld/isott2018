class CreateManuscripts < ActiveRecord::Migration[5.1]
  def change
    create_table :manuscripts do |t|
	t.string :first_author_first_name
	t.string :first_author_last_name
	t.string :first_author_email
	t.string :corresponding_author_first_name
	t.string :corresponding_author_last_name
	t.string :corresponding_author_email
	t.string :filename

      t.timestamps
    end
  end
end
