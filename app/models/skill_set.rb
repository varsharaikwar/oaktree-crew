class SkillSet < ApplicationRecord

    validates :name, uniqueness: { case_sensitive: false, scope: :skill_type, message: "Skill with this name and type already exists" }   
end
  