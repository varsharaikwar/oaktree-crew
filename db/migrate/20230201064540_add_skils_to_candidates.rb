class AddSkilsToCandidates < ActiveRecord::Migration[7.0]
  def change
    add_column :candidates, :skills, :string, array: true, default: []
  end
end
