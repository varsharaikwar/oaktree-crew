class LeadsController < ApplicationController
  before_action :authenticate_user!
    def index
       @leads = Lead.order(created_at: :desc)
    end

    def show
      @lead = Lead.find(params[:id])
    end

    def new
      @lead = Lead.new
      @hr_list = User.with_any_role('junior_hr', 'senior_hr')
      @skill_list = SkillSet.where(skill_type: 'primary')
    end

    def create
      @hr_list = User.with_any_role('junior_hr', 'senior_hr')
      @skill_list = SkillSet.where(skill_type: 'primary')
      @lead = current_user.leads.new(lead_params)
        if @lead.save
          flash[:success] = "Lead created successfully!"
          @lead.assign_user(current_user)
            redirect_to @lead
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
      @lead = Lead.find(params[:id])
      @hr_list = User.with_any_role('junior_hr', 'senior_hr')
      @skill_list = SkillSet.where(skill_type: 'primary')
    end
  
    def update
      @lead = Lead.find(params[:id])
      @hr_list = User.with_any_role('junior_hr', 'senior_hr')
      @skill_list = SkillSet.where(skill_type: 'primary')
        
        if @lead.update(lead_params)
          flash[:success] = "Lead has been updated"
          @lead.assign_user(current_user)
            redirect_to @lead
        else
            render :edit, status: :unprocessable_entity
        end
    end
  
    def destroy
        @lead = Lead.find(params[:id])
        @lead.destroy
        flash[:success] = "Lead deleted successfully!"
        redirect_to leads_path, status: :see_other
    end
  
    def duration_filter
      from_date = Date.parse(params[:from])
      to_date = Date.parse(params[:to])
      from_datetime = DateTime.new(from_date.year, from_date.month, from_date.day)
      to_datetime = DateTime.new(to_date.year, to_date.month, to_date.day, 23, 59, 00, '+00:00')
      @leads = Lead.where(created_at: from_datetime..to_datetime)
      respond_to do |format|
        format.js
      end
    end

  private
    def lead_params
      params.require(:lead).permit(:name, :assigned_to, :status, :additional_info, :file, :profile_array => [])
    end
end
