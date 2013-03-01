class AddFollows < ActiveRecord::Migration
  
  def change
    create_table :follows do |t|
      t.integer :from_user_id
      t.integer :to_user_id
 
      t.timestamps
    end

    add_index :follows, [:from_user_id, :to_user_id], :unique => true

    add_foreign_key :follows, :users, :name => :fk_follows_to_from_users, :dependent => :delete, :column => :from_user_id
    add_foreign_key :follows, :users, :name => :fk_follows_to_to_users, :dependent => :delete, :column => :to_user_id

  end

end
