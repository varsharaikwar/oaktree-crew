class AddUserIdToCandidates < ActiveRecord::Migration[7.0]
  def change
    add_column :candidates, :user_id, :integer
  end
end
