class AddFieldsToCandidate < ActiveRecord::Migration[7.0]
  def change

    add_column :candidates, :current_location, :text
    add_column :candidates, :available_time_zone, :string
    add_column :candidates, :industry, :string
    
  end
end
