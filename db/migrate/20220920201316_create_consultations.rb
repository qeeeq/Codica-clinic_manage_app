class CreateConsultations < ActiveRecord::Migration[7.0]
  def change
    create_table :consultations do |t|
      t.references :doctor
      t.references :patient
      t.text :note
      t.boolean :closed, default: false

      t.timestamps
    end
  end
end
