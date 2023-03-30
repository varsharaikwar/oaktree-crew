class CreateLeadAssignments < ActiveRecord::Migration[7.0]
  def change
    create_table :lead_assignments do |t|
      t.references :candidate, null: false, foreign_key: true
      t.references :lead, null: false, foreign_key: true
      t.integer :hr_id
      t.integer :sales_id

      t.timestamps
    end
  end
end
