class LeadAssignment < ApplicationRecord
  belongs_to :candidate
  belongs_to :lead
  def assign_lead(current_user, lead_assignment, candidate)
    lead =  lead_assignment.lead
    reciver = lead_assignment.lead.user_id
    reciver_type = User.find(reciver)
    candidate = Candidate.find(candidate)
    message = '<div class="container"> 
    <div class="p-3">
        <div class="alert alert-info">
            <p><i class="fa fa-file mr-1"></i><b><a href="candidate/' + candidate.id.to_s + '">' + candidate.first_name + " " + candidate.last_name + '</a> lead has been assigned</b></p>
            <hr>
            <p>by:- <b class="ml-2">' + current_user.name + '</b></p>
            <p>Lead:- <b class="ml-2">' + lead.name + '</b></p>
        </div>
    </div>
    <div class="text-right">
    <a href="/notifications" class="text-success"><i class="fa fa-long-arrow-left"></i> Back </a>
    </div>
</div>'
    current_user.notifications.create(sender_id: current_user.id, sender_type: current_user.roles.first.name, reciver_id: reciver, reciver_type: reciver_type.name, lead: lead, candidate_id:  candidate.id, message:message)
  end
end
