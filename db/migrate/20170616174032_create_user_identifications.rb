class CreateUserIdentifications < ActiveRecord::Migration[5.1]

  def up
    create_table :user_identifications, :id => false do |t|

      t.string "username", :limit => 40, :null => false, :unique => true
      t.string "password_digest", :null => false

      t.timestamps

    end

    add_index :user_identifications, :username
    execute "ALTER TABLE user_identifications ADD PRIMARY KEY (username);"

  end

  def down
    drop_table :user_identifications
  end

end
