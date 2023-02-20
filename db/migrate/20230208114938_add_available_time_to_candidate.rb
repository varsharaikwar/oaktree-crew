class AddAvailableTimeToCandidate < ActiveRecord::Migration[7.0]
  def change
    add_column :candidates, :start_time, :string
    add_column :candidates, :end_time, :string
  end
end
