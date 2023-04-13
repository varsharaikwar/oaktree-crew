class AddVersionsCountToCandidates < ActiveRecord::Migration[7.0]
  def change
    add_column :candidates, :versions_count, :integer
  end
end
