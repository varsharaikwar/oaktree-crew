class InterviewSchedulesController < ApplicationController
    before_action :authenticate_user!
    def index
        @interview_schedules = InterviewSchedule.all
    end

    def new
        candidate = params[:candidate]
        @interview_schedule = InterviewSchedule.new()
        @pool_managers = Role.find_by(name: :pool_manager).users
        @lead_assigned = LeadAssignment.where(candidate_id: params[:candidate], hr_id: current_user.id)
        respond_to do |format|
            format.js
        end
    end

    def create
        candidate = params[:candidate]
        @interview_schedule = InterviewSchedule.new(interview_schedule_params.merge(hr_id: current_user.id, candidate_id: candidate))
        respond_to do |format|
            if @interview_schedule.save
                Lead.find(@interview_schedule.lead_id).update(status: 'interview scheduled') if @interview_schedule.lead_id.present?
                @interview_schedule.interview_schedule(current_user)
                flash[:success] = "Interview has been Scheduled Successfully !!"
                format.js
            end
        end
    end

    def edit
        candidate = params[:candidate]
        @interview_schedule = InterviewSchedule.find(params[:id])
        @pool_managers = Role.find_by(name: :pool_manager).users
        @lead_assigned = LeadAssignment.where(candidate_id: params[:candidate], hr_id: current_user.id)
        respond_to do |format|
            format.js
        end
    end

    def update
        @interview_schedule = InterviewSchedule.find(params[:id])
        respond_to do |format|
            if @interview_schedule.update(interview_schedule_params)
                @interview_schedule.interview_schedule(current_user)
                flash[:success] = "Interview has been Updated Successfully !!"
                format.js
            end
        end
    end
    
    def manager_dashboard
        @hr_list = User.with_any_role("junior_hr", "senior_hr", "manager", "admin")
        @sales_person_list = User.with_any_role(:sales_person, :manager)
    end

    private

    def interview_schedule_params
        params.required(:interview_schedule).permit(:time, :url, :lead_id, :pool_manager_id)
    end
end
