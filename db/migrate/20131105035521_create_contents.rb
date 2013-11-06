class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.string :code
      t.string :cat
      t.text :desc
      t.string :context

      t.timestamps
    end
  end
end
