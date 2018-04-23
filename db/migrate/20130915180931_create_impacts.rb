class CreateImpacts < ActiveRecord::Migration
  def change
    create_table :impacts do |t|
      t.integer :follower_id
      t.integer :followed_id

      t.timestamps
    end
    add_index :impacts, :follower_id
    add_index :impacts, :followed_id
    add_index :impacts, [:follower_id, :followed_id], unique: true
  end
end
