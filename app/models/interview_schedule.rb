class InterviewSchedule < ApplicationRecord
  # validates :interview_schedule, uniqueness: { scope: [:lead_id, :candidate_id] }
  belongs_to :lead
  belongs_to :candidate
  default_scope { order(created_at: :desc) }

  def interview_schedule(current_user)
    reciver_id = self.lead.user.id
    reciver_type = self.lead.user.roles.first.name
    candidate = self.candidate
    
    
    current_user.notifications.create(sender_id: current_user.id , sender_type: current_user.roles.first.name, reciver_id: reciver_id, reciver_type: reciver_type, lead: lead, candidate_id: candidate.id, status: lead.status )
    current_user.notifications.create(sender_id: current_user.id , sender_type: current_user.roles.first.name, reciver_id: self.pool_manager_id, reciver_type: 'pool_manager', lead: lead, candidate_id: candidate.id, status: lead.status )
  end

end

