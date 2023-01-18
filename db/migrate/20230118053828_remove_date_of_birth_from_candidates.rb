class RemoveDateOfBirthFromCandidates < ActiveRecord::Migration[7.0]
  def change
    remove_column :candidates, :date_of_birth, :string
  end
end
