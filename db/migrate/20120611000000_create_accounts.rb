class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :provider, :null => false
      t.string :uid, :null => false
      t.string :name, :null => false
      t.string :screen_name, :null => false
      t.string :image
      t.string :token, :null => false
      t.string :secret, :null => false

      t.timestamps
    end
    add_index :accounts, [:provider, :uid], :unique => true
  end
end
