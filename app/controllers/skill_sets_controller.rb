class SkillSetsController < ApplicationController

    def new
        @skill_set = SkillSet.new
    end

    def create
        @skill_name = params[:skill_type]
        @primary_skill = SkillSet.where(skill_type: 'primary')
        @secondary_skill = SkillSet.where(skill_type: 'secondary')
        @skill_set = SkillSet.new(skill_set_params)
        
        respond_to do |format|
            if @skill_set.save
                format.js 
            end
        end
    end
end
  
private

def skill_set_params
    params.require(:skill_set).permit(:name, :skill_type)
end


