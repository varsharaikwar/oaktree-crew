class LeadAssignmentsController < ApplicationController
    def create
        lead = Lead.find(params[:lead_assignment][:lead].to_i)
        hr_id = current_user.id
        candidate = Candidate.find(params[:lead_assignment][:candidate_id])
        sales_id = lead.user_id
        @lead_assignment = LeadAssignment.new(lead: lead, candidate: candidate, hr_id: hr_id, sales_id: sales_id)

        if @lead_assignment.save
            @lead_assignment.lead.update(status: 'assigned')
            @lead_assignment.assign_sales(current_user, @lead_assignment)
            respond_to do |format|
                format.js
            end
        end
    end
end
