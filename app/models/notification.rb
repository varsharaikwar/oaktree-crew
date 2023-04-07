class Notification < ApplicationRecord
  belongs_to :lead, optional: true
  belongs_to :user
end
