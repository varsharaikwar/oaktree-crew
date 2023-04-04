class Lead < ApplicationRecord
  after_initialize :set_default_status
  belongs_to :user
  has_many :notifications, dependent: :destroy
  has_many :lead_assignments, dependent: :destroy
  has_one :interview_schedules, dependent: :destroy
  
  def assign_user(current_user, lead)
    reciver = User.find_by(email: lead.assigned_to)
    message =  '<div class="container"> 
    <div class="p-3">
        <div class="alert alert-info">
            <p><i class="fa fa-address-card mr-1"></i><b>From: ' + current_user.name + '</b></p>
            <hr>
            <div class="row">
                <div class="col-lg-6">
                    <p>Name:- <b class="ml-2">' + lead.name + '</b></p>
                    <p>Profile:- <b class="ml-2">' + lead.profile + '</b></p>
                </div>
                <div class="col-lg-6">
                    <p>Status:- <b class="ml-2">' + lead.status + '</b></p>
                    <p>Additional Info:- <b class="ml-2">' + lead.additional_info + '</b></p>
                </div>
            </div>
        </div>
        <div class="text-right">
            <a href="/notifications" class="text-success"><i class="fa fa-long-arrow-left"></i> Back </a>
        </div>
    </div>
</div>'
    current_user.notifications.create(sender_id: current_user.id, sender_type: current_user.roles.first.name, reciver_id: reciver.id, reciver_type: reciver.roles.first.name, lead: lead, message: message)
  end
  def set_default_status
    self.status ||= 'in progress'
  end
end
