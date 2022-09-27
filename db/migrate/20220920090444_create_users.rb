class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :phone, index: true, null: false
      t.string :type, index: true, null: false

      t.timestamps
    end
  end
end
