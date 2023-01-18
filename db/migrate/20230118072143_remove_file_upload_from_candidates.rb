class RemoveFileUploadFromCandidates < ActiveRecord::Migration[7.0]
  def change
    remove_column :candidates, :file_upload, :string
  end
end
