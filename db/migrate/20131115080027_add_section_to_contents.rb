class AddSectionToContents < ActiveRecord::Migration
  def change
    add_column :contents, :section, :string
  end
end
