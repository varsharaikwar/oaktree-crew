class Lead < ApplicationRecord
  after_initialize :set_default_status
  belongs_to :user
  has_many :notifications, dependent: :destroy
  has_many :lead_assignments, dependent: :destroy
  has_many :interview_schedules, dependent: :destroy
  default_scope { order(created_at: :desc) }
  validates :name, :assigned_to, presence: true  
  mount_uploader :file, LeadAttachmentUploader
  STATUS_LIST = ["Won", "Lost"]


  def assign_user(current_user)
    reciver = User.find_by(email: self.assigned_to)
    status = self.status

    current_user.notifications.create(sender_id: current_user.id, sender_type: current_user.roles.first.name, reciver_id: reciver.id, reciver_type: reciver.roles.first.name, lead: self, status: status)
  end
  
  def set_default_status
    self.status ||= 'in progress'
  end

end
