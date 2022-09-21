class AddNoteToConsultations < ActiveRecord::Migration[7.0]
  def change
    add_column :consultations, :note, :text
  end
end
