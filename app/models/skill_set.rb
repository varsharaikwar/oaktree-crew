class SkillSet < ApplicationRecord

    validates :name, uniqueness: { scope: :skill_type, message: "Skill with this name and type already exists" }
  
end
  