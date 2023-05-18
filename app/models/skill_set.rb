class SkillSet < ApplicationRecord
    Section_LIST = ["salesforce", "frontend", "backend", "mobile", "fullstack"]


    validates :name,presence: true, uniqueness: { case_sensitive: false, scope: :skill_type, message: "Skill with this name and type already exists" }
    validate :validate_skill_array
    
    def validate_skill_array
        unless section.join.present?
            errors.add(:your_column_name, "Section field can`t be blank!")
        end
    end
end
  