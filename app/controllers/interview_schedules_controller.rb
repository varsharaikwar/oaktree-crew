class InterviewSchedulesController < ApplicationController
    before_action :authenticate_user!
    def index
        @interview_schedules = InterviewSchedule.all
    end

    def create
        candidate = params[:candidate]
        @interview_schedule = InterviewSchedule.new(interview_schedule_params.merge(hr_id: current_user.id, candidate_id: candidate))
        respond_to do |format|
            if @interview_schedule.save
                Lead.find(@interview_schedule.lead_id).update(status: 'interview scheduled') if @interview_schedule.lead_id.present?
                @interview_schedule.interview_schedule(current_user)
                format.js
            end
        end
    end
    
    private

    def interview_schedule_params
        params.required(:interview_schedule).permit(:time, :url, :lead_id, :pool_manager_id)
    end
end
