class InterviewSchedule < ApplicationRecord
  validates :url, presence: true
  belongs_to :lead, optional: true, dependent: :destroy
  belongs_to :candidate, dependent: :destroy
  default_scope { order(created_at: :desc) }

  def interview_schedule(current_user)
    
    candidate = self.candidate
    if self.lead_id.present?
      lead = Lead.find(self.lead_id)
      reciver_id = lead.user.id
      reciver_type = lead.user.roles.first.name
      status = lead.status
      current_user.notifications.create(sender_id: current_user.id , sender_type: current_user.roles.first.name, reciver_id: reciver_id, reciver_type: reciver_type, lead: lead, candidate_id: candidate.id, status: status )
    else 
      lead = nil
      reciver_id = 6
      reciver_type = "sales_person"
      status = "interview scheduled"
    end
    
    current_user.notifications.create(sender_id: current_user.id , sender_type: current_user.roles.first.name, reciver_id: self.pool_manager_id, reciver_type: 'pool_manager', lead: lead, candidate_id: candidate.id, status: status )
  end

  def formatted_time
    begin
      parsed_time = Time.parse(time)
      formatted_time = parsed_time.strftime("%I:%M %p")
    rescue ArgumentError
      formatted_time = "Not Available"
    end  
  end

  def formatted_date
    begin
      parsed_time = Time.parse(time)
      formatted_time = parsed_time.strftime("%d-%m-%Y")
    rescue ArgumentError
      formatted_time = "Not Available"
    end
  end

end

