class AddSectionToSkillSets < ActiveRecord::Migration[7.0]
  def change
    add_column :skill_sets, :section, :string, array: true, default: []
  end
end
