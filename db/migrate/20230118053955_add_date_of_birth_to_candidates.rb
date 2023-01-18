class AddDateOfBirthToCandidates < ActiveRecord::Migration[7.0]
  def change
    add_column :candidates, :date_of_birth, :date
  end
end
