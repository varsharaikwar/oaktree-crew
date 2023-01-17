class AddFileUploadToCandidates < ActiveRecord::Migration[7.0]
  def change
    add_column :candidates, :file_upload, :string
  end
end
