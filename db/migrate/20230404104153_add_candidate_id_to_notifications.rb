class AddCandidateIdToNotifications < ActiveRecord::Migration[7.0]
  def change
    add_column :notifications, :candidate_id, :integer
  end
end
