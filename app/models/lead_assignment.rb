class LeadAssignment < ApplicationRecord
  belongs_to :candidate
  belongs_to :lead

    def assign_lead(current_user)
      lead =  self.lead
      reciver = User.find(lead.user_id)
      candidate = Candidate.find(self.candidate_id)
      current_user.notifications.create(sender_id: current_user.id, sender_type: current_user.roles.first.name, reciver_id: reciver.id, reciver_type: reciver.roles.first, lead: lead, candidate_id: candidate.id, status: lead.status)
    end

end
