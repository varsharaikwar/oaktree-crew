ActiveAdmin.register Candidate do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
   permit_params :first_name, :last_name, :email, :phone, :gender, :marital_status, :nationality, :address, :notes, :present_salary, :expected_salary, :category, :job_level, :job_nature, :level_of_education, :degree, :group, :institute_name, :result, :marks, :year_of_passing, :duration, :company_name, :company_business, :designation, :department, :responsiblities, :company_location, :employment_period, :date_of_birth, :file, :status, :user_id, :current_location, :available_time_zone, :industry, :start_time, :end_time
  #
  # or
  #
  # permit_params do
  #   permitted = [:first_name, :last_name, :email, :phone, :gender, :marital_status, :nationality, :address, :notes, :present_salary, :expected_salary, :category, :job_level, :job_nature, :level_of_education, :degree, :group, :institute_name, :result, :marks, :year_of_passing, :duration, :company_name, :company_business, :designation, :department, :responsiblities, :company_location, :employment_period, :slug, :date_of_birth, :file, :status, :user_id, :current_location, :primary_skill, :secondary_skill, :available_time_zone, :industry, :start_time, :end_time]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
