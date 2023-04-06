class LeadAssignmentsController < ApplicationController
    def create
        lead = Lead.find(params[:lead_assignment][:lead].to_i)
        candidate = Candidate.find(params[:candidate])
        @lead_assignment = LeadAssignment.new(lead: lead, candidate: candidate, hr_id: current_user.id, sales_id: lead.user_id)
        if @lead_assignment.save
            @lead_assignment.lead.update(status: 'assigned')
            @lead_assignment.assign_lead(current_user)
            respond_to do |format|
                format.js
            end
        end
    end
end
