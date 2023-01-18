class AddFileToCandidates < ActiveRecord::Migration[7.0]
  def change
    add_column :candidates, :file, :string
  end
end
