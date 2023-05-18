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
            if SkillSet.exists?(name: params[:skill_set][:name], skill_type: params[:skill_set][:skill_type])
                @response = "present"
                format.js 
            elsif @skill_set.save
                @response = "saved"
                format.js
            else
                @response = "error"
                format.js
            end
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
    params.require(:skill_set).permit(:name, :skill_type, :section => []).merge(section: [params[:skill_set][:section]])
end


