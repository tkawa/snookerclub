class CreatePlays < ActiveRecord::Migration
  def change
    create_table :plays do |t|
      t.integer :table_id
      t.timestamp :starts_at, :null => false
      t.timestamp :ends_at
      t.text :note
      t.references :account

      t.timestamps
    end
  end
end
