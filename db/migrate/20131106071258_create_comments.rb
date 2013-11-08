class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :content, index: true
      t.text :body

      t.timestamps
    end
  end
end
