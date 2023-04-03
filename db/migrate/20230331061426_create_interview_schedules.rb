class CreateInterviewSchedules < ActiveRecord::Migration[7.0]
  def change
    create_table :interview_schedules do |t|
      t.references :lead, null: false, foreign_key: true
      t.references :candidate, null: false, foreign_key: true
      t.string :url
      t.string :time
      t.integer :hr_id

      t.timestamps

      t.index [:candidate_id, :lead_id ], unique: true
    end
  end
end
