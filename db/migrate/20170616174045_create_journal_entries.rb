class CreateJournalEntries < ActiveRecord::Migration[5.1]

  def up
    create_table :journal_entries do |t|

      t.string "user_identification_username", :null => false

      t.datetime "entry_created_at", :null => false
      t.text "entry"

    end

    add_index :journal_entries, :user_identification_username
    execute "ALTER TABLE journal_entries ADD CONSTRAINT FK_user_identification_username FOREIGN KEY (user_identification_username) REFERENCES user_identifications (username);"

  end

  def down
    drop_table :journal_entries
  end

end
