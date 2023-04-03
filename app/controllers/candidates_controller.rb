class CandidatesController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource :candidate, class: Candidate, except: [:show, :edit, :destroy, :update]

    def index
      @primary_skill = SkillSet.where(skill_type: "primary")
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
      @candidates = @candidates.paginate(page: params[:page], per_page: 12)      
    end
    
    def show
      @candidate = Candidate.find(params[:id])
      @lead_assignment = LeadAssignment.new
      @lead = Lead.where(assigned_to: current_user.email)
      @lead_assigned = LeadAssignment.where(candidate_id: @candidate.id, hr_id: current_user.id)
      authorize! :show, @candidate
    end

    def new
      @primary_skill = SkillSet.where(skill_type: "primary")
      @secondary_skill = SkillSet.where(skill_type: "secondary")
      @candidate = Candidate.new
      
      # authorize! :new, @candidate
    end

    def create
      @primary_skill = SkillSet.where(skill_type: "primary")
      @secondary_skill = SkillSet.where(skill_type: "secondary")
      @candidate = current_user.candidates.create(candidate_params.merge(current_location: params[:current_location].to_s, city: params[:city].to_s))    
      @candidate.status = "Draft"
        if @candidate.save
          flash[:success] = "Candidate created successfully!"
          redirect_to @candidate
        else
          render :new, status: :unprocessable_entity
        end
        # authorize! :create, @candidate
    end

    def edit
      @primary_skill = SkillSet.where(skill_type: "primary")
      @secondary_skill = SkillSet.where(skill_type: "secondary")
      @candidate = Candidate.find(params[:id])
      authorize! :edit, @candidate
    end
  
    def update
      @primary_skill = SkillSet.where(skill_type: "primary")
      @secondary_skill = SkillSet.where(skill_type: "secondary")
      @candidate = Candidate.find(params[:id])
      if params[:status]
          if @candidate.update(status: params[:status])
            respond_to do |format|
              format.js
            end
          end
      elsif params[:current_location].present? 
        @candidate.update(candidate_params.merge(current_location: params[:current_location].to_s, city: params[:city].to_s))
        redirect_to @candidate
      elsif @candidate.update(candidate_params)
        flash[:success] = "Candidate Updated successfully!"
        redirect_to @candidate
      else
        render :edit, status: :unprocessable_entity
      end
      authorize! :edit, @candidate 
    end

    def destroy
      @candidate = Candidate.find(params[:id])
      @candidate.destroy
      redirect_to root_path, status: :see_other
      authorize! :destroy, @candidate
    end

    def logout
    end

    def show_states
      @country = params[:country]
    end

    def show_cities
      @country = params[:country]
      @state = params[:state]
      respond_to do |format|
        format.js
      end
    end

    def filter
      search_data = []
      search_data << "city = '#{params[:city_name]}'" if params[:city_name].present?
      search_data << "category = '#{params[:category_name]}'" if params[:category_name].present?
      search_data << "(cast(primary_skill as varchar) ILIKE ANY (ARRAY['%#{params[:skill_array].join("%','%")}%']) OR cast(secondary_skill as varchar) ILIKE ANY (ARRAY['%#{params[:skill_array].join("%','%")}%']))" if params[:skill_array].present?

      search_data = search_data.join(" AND ") rescue ""
      
      candidates =  Candidate.where(search_data)
      @candidates = candidates.paginate(page: params[:page], per_page: 12)  
      respond_to do |format|
        format.js
        format.html do
          render :index
        end
      end
    end
    def skill
      @primary_skill = SkillSet.where(skill_type: "primary")
      @candidate = Candidate.where(category: params[:category_name].split("-").join(" "))
    end
      

    private
    def candidate_params
      params.require(:candidate).permit(:first_name, :last_name, :email, :phone, :date_of_birth, :gender, :marital_status, :nationality, :address, :notes, :present_salary, :expected_salary, :category, :job_level, :job_nature, :level_of_education, :degree, :group, :institute_name, :result, :marks, :year_of_passing, :duration, :company_name, :company_business, :designation, :department, :responsiblities, :company_location, :city, :employment_period, :image, :file, :updated_file, :link, :current_location, :experience, :available_time_zone, :language, :start_time, :end_time, :primary_skill => [], :secondary_skill => [])
    end
end
