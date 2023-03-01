class AddUpdatedFileToCandidates < ActiveRecord::Migration[7.0]
  def change
    add_column :candidates, :updated_file, :string
  end
end
