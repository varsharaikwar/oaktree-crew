class InterviewSchedule < ApplicationRecord
  # validates :interview_schedule, uniqueness: { scope: [:lead_id, :candidate_id] }
  belongs_to :lead
  belongs_to :candidate

  def interview_schedule(current_user, lead, candidate)
    reciver_id = lead.user.id
    reciver_type = lead.user.roles.first.name
    candidate = Candidate.find(candidate)

    interview_data = InterviewSchedule.find_by(candidate: candidate, hr_id: current_user.id, lead: lead)
    message = '<div class="container"> 
    <div class="p-3">
        <div class="alert alert-info">
            <p><b<a href="candidate/' + candidate.id.to_s + '">' + candidate.first_name + " " + candidate.last_name + '</a> interview has been scheduled</b><span class="float-right ml-2">Time<b class="ml-2"><i class="fa fa-clock mr-1"></i>' + interview_data.time + '</b></span></p>
            <hr>
            <p>Scheduled by:- <b class="ml-2">' + current_user.name + '</b></p>
            <p>Lead:- <b class="ml-2">' + lead.name + '</b></p>
        </div>
    </div>
</div>'
    current_user.notifications.create(sender_id: current_user.id , sender_type: current_user.roles.first.name, reciver_id: reciver_id, reciver_type: reciver_type, lead: lead, candidate_id: candidate.id, message: message )
  end

end

