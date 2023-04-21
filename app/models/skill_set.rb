class SkillSet < ApplicationRecord
    Section_LIST = ["salesforce", "frontend", "backend", "mobile", "fullstack"]


    validates :name, uniqueness: { case_sensitive: false, scope: :skill_type, message: "Skill with this name and type already exists" }   
end
  