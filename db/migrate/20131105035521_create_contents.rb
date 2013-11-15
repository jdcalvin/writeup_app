class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.string :code
      t.string :cat
      t.text :desc
      t.string :context
      t.string :section

      t.timestamps
    end
  end
end
