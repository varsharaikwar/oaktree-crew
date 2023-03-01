ActiveAdmin.register SkillSet do
 action_item :view, only: :show do
    link_to "New Skill Set", new_admin_skill_set_path
  end
  form do |f|
    f.inputs do
    f.input :name
    f.input :skill_type , :as => :select,  collection: (['primary','secondary']), include_blank: 'select'

    end
    actions 
  end
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :skill_type
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :skill_type]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
