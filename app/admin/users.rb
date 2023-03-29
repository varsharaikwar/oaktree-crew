ActiveAdmin.register User do
  permit_params [:name, :email, :password, :password_confirmation,  role_ids: []] 

  action_item :view, only: :show do
    link_to "New User", new_admin_user_path
  end

  form do |f|
    f.inputs "User Details" do
      f.input :name
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :roles, as: :check_boxes
    end
    f.actions
  end
  
  controller do
    def update
      if params[:user][:password].blank?
        params[:user].delete "password"
        params[:user].delete "password_confirmation"
      end

      super
    end
  end
end
