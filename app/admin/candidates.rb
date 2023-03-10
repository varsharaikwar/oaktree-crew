ActiveAdmin.register Candidate do

   permit_params :first_name, :last_name, :email, :phone, :gender, :marital_status, :nationality, :address, :notes, :present_salary, :expected_salary, :category, :job_level, :job_nature, :level_of_education, :degree, :group, :institute_name, :result, :marks, :year_of_passing, :duration, :company_name, :company_business, :designation, :department, :responsiblities, :company_location, :employment_period, :date_of_birth, :file, :status, :user_id, :current_location, :available_time_zone, :industry, :start_time, :end_time

   action_item :view, only: :show do
    link_to "New Candidate", new_admin_candidate_path
   end
  end
