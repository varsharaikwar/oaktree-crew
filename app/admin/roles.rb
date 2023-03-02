ActiveAdmin.register Role do

  permit_params :name, :resource_id

  action_item :view, only: :show do
    link_to "New Role", new_admin_role_path
  end
  
end
