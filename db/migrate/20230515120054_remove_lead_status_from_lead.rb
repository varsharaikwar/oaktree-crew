class RemoveLeadStatusFromLead < ActiveRecord::Migration[7.0]
  def change
    remove_column :leads, :lead_status, :string
  end
end
