class InterviewSchedulesController < ApplicationController
    before_action :authenticate_user!
    def index
        @interview_schedules = InterviewSchedule.all
    end

    def create
        @interview_schedule = InterviewSchedule.new(interview_schedule_params)
        candidate = params[:candidate]
        lead = Lead.find(params[:interview_schedule][:lead_id])
        respond_to do |format|
            if @interview_schedule.save
                @interview_schedule.interview_schedule(current_user)
                lead.update(status: 'interview scheduled')
                format.js
            end
        end
    end
    
    private

    def interview_schedule_params
        params.required(:interview_schedule).permit(:time, :url, :hr_id, :candidate_id, :lead_id, :pool_manager_id)
    end
end
