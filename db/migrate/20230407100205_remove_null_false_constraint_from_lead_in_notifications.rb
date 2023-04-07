class RemoveNullFalseConstraintFromLeadInNotifications < ActiveRecord::Migration[7.0]
  def change
    change_column_null :notifications, :lead_id, true
  end
end
