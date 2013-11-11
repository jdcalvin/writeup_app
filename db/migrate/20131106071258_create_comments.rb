class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :content, index: true
      t.text :body

      t.timestamps
    end
   add_index :comments, [:user_id, :created_at]
  end
end
