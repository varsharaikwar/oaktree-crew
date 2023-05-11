class AddLeadStatusToLeads < ActiveRecord::Migration[7.0]
  def change
    add_column :leads, :lead_status, :string
  end
end
