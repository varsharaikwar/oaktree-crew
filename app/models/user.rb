class User < ApplicationRecord
  rolify
  has_many :candidates
  has_many :comments
  has_many :leads
  has_many :notifications
  has_many :lead_assignments
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         def unread_notifications_count
          notifications.where(read: false).count
        end
end

