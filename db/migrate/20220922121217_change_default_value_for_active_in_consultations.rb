class ChangeDefaultValueForActiveInConsultations < ActiveRecord::Migration[7.0]
  def change
    change_column :consultations, :closed, :boolean, default: false
  end
end
