class CreateCandidates < ActiveRecord::Migration[7.0]
  def change
    create_table :candidates do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.string :date_of_birth
      t.string :gender
      t.string :marital_status
      t.string :nationality
      t.string :address
      t.string :notes
      t.string :present_salary
      t.string :expected_salary
      t.string :category
      t.string :job_level
      t.string :job_nature
      t.string :level_of_education
      t.string :degree
      t.string :group
      t.string :institute_name
      t.string :result
      t.integer :marks
      t.integer :year_of_passing
      t.integer :duration
      t.string :company_name
      t.string :company_business
      t.string :designation
      t.string :department
      t.string :responsiblities
      t.string :company_location
      t.string :employment_period

      t.timestamps
    end
  end
end
