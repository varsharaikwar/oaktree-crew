class CandidatesController < ApplicationController
  load_and_authorize_resource :candidate, class: Candidate

    def index
      @candidates = Candidate.all
    end
    
    def show
      @candidate = Candidate.friendly.find(params[:id])
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

    def edit
      @candidate = Candidate.friendly.find(params[:id])
    end
  
    def update
      @candidate = Candidate.friendly.find(params[:id])
  
      if @candidate.update(candidate_params)
        redirect_to @candidate
      else
        render :edit, status: :unprocessable_entity
      end
    end

    def destroy
      @candidate = Candidate.friendly.find(params[:id])
      @candidate.destroy
  
      redirect_to root_path, status: :see_other
    end

    def logout
    end

    
    private
        def candidate_params
            params.require(:candidate).permit(:first_name, :last_name, :email, :phone, :date_of_birth, :gender, :marital_status, :nationality, :address, :notes, :present_salary, :expected_salary, :category, :job_level, :job_nature, :level_of_education, :degree, :group, :institute_name, :result, :marks, :year_of_passing, :duration, :company_name, :company_business, :designation, :department, :responsiblities, :company_location, :employment_period, :image, :file)
        end
end
