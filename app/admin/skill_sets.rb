ActiveAdmin.register SkillSet do

  permit_params :name, :skill_type => [], :section => []

  action_item :view, only: :show do
    link_to "New Skill Set", new_admin_skill_set_path
  end

  form do |f|
    f.inputs do
    f.input :name
    f.input :skill_type, :as => :check_boxes,  collection: (['primary','secondary']), include_blank: 'select'
    f.input :section, :as => :check_boxes,  collection: (['salesforce','frontend', 'backend', 'mobile', 'fullstack']), include_blank: 'select'
    end
    actions 
  end
  
  controller do
    def create
      skill_set = params[:skill_set][:skill_type].compact.reject(&:blank?)
      skill_set.each do |skill|
        a =  SkillSet.create!(name: params[:skill_set][:name], skill_type: skill, section: params[:skill_set][:section].compact.reject(&:blank?))
      end
      redirect_to admin_skill_sets_path
    end
  end
end