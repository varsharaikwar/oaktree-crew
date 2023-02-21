class AddImageToCandidates < ActiveRecord::Migration[7.0]
  def change
    add_column :candidates, :image, :string
  end
end
