class RenameColumnForConsultations < ActiveRecord::Migration[7.0]
  def change
    rename_column :consultations, :active, :closed
  end
end
