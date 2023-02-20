class AddPrimarySkillToCandidate < ActiveRecord::Migration[7.0]
  def change
    add_column :candidates, :primary_skill, :string,  array: true, default: []
  end
end
