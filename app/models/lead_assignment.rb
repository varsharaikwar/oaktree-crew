class LeadAssignment < ApplicationRecord
  belongs_to :candidate
  belongs_to :lead
  def assign_sales(current_user, lead_assignment)
    lead =  lead_assignment.lead
    reciver = lead_assignment.lead.user_id
    reciver_type = User.find(reciver)
    current_user.notifications.create(sender_id: current_user.id, sender_type: current_user.roles.first.name, reciver_id: reciver, reciver_type: reciver_type.name, lead: lead )
  end
end
