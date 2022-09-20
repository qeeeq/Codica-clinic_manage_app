class CreateConsultations < ActiveRecord::Migration[7.0]
  def change
    create_table :consultations do |t|
      t.references :doctor
      t.references :patient
      t.boolean :active, default: true
      
      t.timestamps
    end
  end
end
