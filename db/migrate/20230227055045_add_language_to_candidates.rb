class AddLanguageToCandidates < ActiveRecord::Migration[7.0]
  def change
    add_column :candidates, :language, :string
  end
end
