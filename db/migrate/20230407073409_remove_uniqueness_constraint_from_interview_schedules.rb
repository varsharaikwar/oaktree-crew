class RemoveUniquenessConstraintFromInterviewSchedules < ActiveRecord::Migration[7.0]
  def change
    remove_index :interview_schedules, [:candidate_id, :lead_id]
    change_column :interview_schedules, :lead_id, :integer, null: true
  end
end
