class AddSlugToCandidates < ActiveRecord::Migration[7.0]
  def change
    add_column :candidates, :slug, :string
    add_index :candidates, :slug, unique: true
  end
end
