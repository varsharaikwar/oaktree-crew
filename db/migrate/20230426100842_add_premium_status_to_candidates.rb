class AddPremiumStatusToCandidates < ActiveRecord::Migration[7.0]
  def change
    add_column :candidates, :premium_status, :string
  end
end
