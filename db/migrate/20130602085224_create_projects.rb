class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.integer :user_id
      t.string :title
      t.string :description
      t.float :value1
      t.float :value2
      t.string :unit

      t.timestamps
    end
    add_index :projects, [:user_id, :created_at]
  end
end
