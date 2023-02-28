ActiveAdmin.register SkillSet do
  action_item :view, only: :show do
    link_to "Add New Skill Set", new_admin_skill_set_path
  end
  form do |f|
    f.inputs do
    f.input :name
    f.input :skill_type , :as => :select,  collection: (['primary','secondary']), include_blank: 'select'
    end
    actions 
  end
  permit_params :name, :skill_type
end
