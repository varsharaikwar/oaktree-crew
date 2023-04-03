class CreateLeads < ActiveRecord::Migration[7.0]
  def change
    create_table :leads do |t|
      t.string :name
      t.string :profile
      t.string :assigned_to
      t.string :status, default: 'in-progress'
      t.text :additional_info
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
