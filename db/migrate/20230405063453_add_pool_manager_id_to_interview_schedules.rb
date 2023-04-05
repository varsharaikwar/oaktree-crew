class AddPoolManagerIdToInterviewSchedules < ActiveRecord::Migration[7.0]
  def change
    add_column :interview_schedules, :pool_manager_id, :integer
  end
end
