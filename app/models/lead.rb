class Lead < ApplicationRecord
  belongs_to :user
  has_many :notifications, dependent: :destroy
  has_many :lead_assignments
  def assign_user(current_user, lead)
    reciver = User.find_by(email: lead.assigned_to)
    current_user.notifications.create(sender_id: current_user.id, sender_type: current_user.roles.first.name, reciver_id: reciver.id, reciver_type: reciver.roles.first.name, lead: lead )
  end
end
