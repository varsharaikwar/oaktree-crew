class CreateSkillSets < ActiveRecord::Migration[7.0]
  def change
    create_table :skill_sets do |t|
      t.string :name
      t.string :skill_type

      t.timestamps
    end
  end
end
