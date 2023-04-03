class InterviewSchedule < ApplicationRecord
  # validates :interview_schedule, uniqueness: { scope: [:lead_id, :candidate_id] }
  belongs_to :lead
  belongs_to :candidate

  def interview_schedule(current_user, notification)
    lead = notification.lead
    reciver_id = notification.sender_id
    reciver_type = notification.sender_type
    current_user.notifications.create(sender_id: current_user.id , sender_type: current_user.roles.first.name, reciver_id: reciver_id, reciver_type: reciver_type, lead: lead )
  end

end

