class AddSecondarySkillToCandidate < ActiveRecord::Migration[7.0]
  def change
    add_column :candidates, :secondary_skill, :string, array: true, default: []
  end
end
