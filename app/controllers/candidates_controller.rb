class CandidatesController < ApplicationController
    def index
    end

    def new
        @candidate = Candidate.new
    end

    def create
        @candidate = Candidate.new(candidate_params)
    
        if @candidate.save
          redirect_to @candidate
        else
          render :new, status: :unprocessable_entity
        end
      end

    private
        def candidate_params
            params.require(:candidate).permit(:first_name, :last_name, :email, :phone, :date_of_birth, :gender, :marital_status, :nationality, :address, :notes, :present_salary, :expected_salary, :category, :job_level, :job_nature, :level_of_education, :degree, :group, :institute_name, :result, :marks, :year_of_passing, :duration, :company_name, :company_business, :designation, :department, :responsiblities, :company_location, :employment_period, :file_upload)
        end
end
