class SkillSetsController < ApplicationController

    def new
        @skill_set = SkillSet.new
    end

    def create
        @skill_name = params[:skill_type]
        @primary_skill = SkillSet.where(skill_type: 'primary')
        @secondary_skill = SkillSet.where(skill_type: 'secondary')
        @skill_set = SkillSet.new(skill_set_params)
        
        if SkillSet.exists?(name: @skill_set.name, skill_type: @skill_set.skill_type)
            respond_to do |format|
                format.js { render js: "alert('A skill with this name and type already exists.');" }
            end
        else
            @skill_set = SkillSet.create(skill_set_params)
        end
    end
end
def show_more
    if @primary_skill = SkillSet.where(skill_type: 'primary')
        respond_to do |format|
        format.js
        end
    end
end
  
private

def skill_set_params
    params.require(:skill_set).permit(:name, :skill_type, :section => [])
end


