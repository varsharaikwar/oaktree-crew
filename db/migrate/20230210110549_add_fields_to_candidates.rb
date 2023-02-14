class AddFieldsToCandidates < ActiveRecord::Migration[7.0]
  def change
    add_column :candidates, :current_location, :text
    add_column :candidates, :primary_skill, :string, array: true, default: []
    add_column :candidates, :secondary_skill, :string, array: true, default: []
    add_column :candidates, :available_time_zone, :datetime
    add_column :candidates, :industry, :string
    add_column :candidates, :available_time, :datetime
  end
end
