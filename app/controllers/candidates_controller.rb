class CandidatesController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource :candidate, class: Candidate, except: [:show, :edit, :destroy, :update]

    def index
      if params[:query].present?
        @candidates = Candidate.global_search(params[:query]) 
      else
        @candidates = Candidate.all
      end
      @draft = Candidate.all
      @status = @draft.where(status: "Draft")
      @final_status = @status.count
      @active = Candidate.all
      @active_status = @active.where(status: "Active")
      @final_active_status = @active_status.count
      # authorize! :index, @candidates
    end
    
    def show
      @candidate = Candidate.friendly.find(params[:id])
      authorize! :show, @candidate
    end

    def new
        @primary_skill = SkillSet.where(skill_type: "primary")
        @secondary_skill = SkillSet.where(skill_type: "secondary")
        @candidate = Candidate.new
        # authorize! :new, @candidate
    end

    def create
      @candidate = Candidate.new(candidate_params)
      @candidate.status = "Draft"
    
        if @candidate.save
          redirect_to @candidate
        else
          render :new, status: :unprocessable_entity
        end
        # authorize! :create, @candidate
    end

    def edit
      @candidate = Candidate.friendly.find(params[:id])
      authorize! :edit, @candidate
    end
  
    def update
      @candidate = Candidate.friendly.find(params[:id])
      if params[:status]
          if @candidate.update(status: params[:status])
            respond_to do |format|
              format.js
            end
          end
      elsif @candidate.update(candidate_params)
          redirect_to @candidate
      else
          render :update, status: :unprocessable_entity
      end
      authorize! :edit, @candidate 
    end

    def destroy
      @candidate = Candidate.friendly.find(params[:id])
      @candidate.destroy
      redirect_to root_path, status: :see_other
      authorize! :destroy, @candidate
    end

    def logout
    end
  
    private
      def candidate_params
        params.require(:candidate).permit(:first_name, :last_name, :email, :phone, :date_of_birth, :gender, :marital_status, :nationality, :address, :notes, :present_salary, :expected_salary, :category, :job_level, :job_nature, :level_of_education, :degree, :group, :institute_name, :result, :marks, :year_of_passing, :duration, :company_name, :company_business, :designation, :department, :responsiblities, :company_location, :employment_period, :image, :file, :current_location, :available_time_zone,:start_time, :end_time, :primary_skill => [], :secondary_skill => [])
      end
end
