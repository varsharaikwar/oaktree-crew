class AddArrayToLeads < ActiveRecord::Migration[7.0]
  def change
    add_column :leads, :profile_array, :text, array: true, default: []

    remove_column :leads, :profile
  end
end
