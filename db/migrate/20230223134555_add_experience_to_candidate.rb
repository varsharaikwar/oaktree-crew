class AddExperienceToCandidate < ActiveRecord::Migration[7.0]
  def change
    add_column :candidates, :experience, :string
  end
end
