class LeadsController < ApplicationController
  before_action :authenticate_user!
  def index
      @leads = Lead.all
  end
  def show
      @lead = current_user.leads.find(params[:id])
  end
  def new
      @lead = Lead.new
      @hr_list = User.with_any_role('junior_hr', 'senior_hr')
      @category_list = Candidate::CATEGORY_LIST
  end
  
  def create
      @lead = current_user.leads.new(lead_params)
      if @lead.save
        @lead.assign_user(current_user, @lead)
          redirect_to @lead
      else
          render :new, status: :unprocessable_entity
      end
  end
  def edit
      @lead = current_user.leads.find(params[:id])
      @hr_list = User.with_any_role('junior_hr', 'senior_hr')
      @category_list = Candidate::CATEGORY_LIST
  end
  
  def update
      @lead = current_user.leads.find(params[:id])

      if @lead.update(lead_params)
          redirect_to @lead
      else
          render :edit, status: :unprocessable_entity
      end
  end
  
  def destroy
      @lead = current_user.leads.find(params[:id])
      @lead.destroy
     redirect_to root_path, status: :see_other
  end
  
  private
  def lead_params
    params.require(:lead).permit(:name, :profile, :assigned_to, :status, :additional_info)
  end
end
