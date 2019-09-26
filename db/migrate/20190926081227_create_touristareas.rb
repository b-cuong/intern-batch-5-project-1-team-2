class CreateTouristareas < ActiveRecord::Migration[5.2]
  def change
    create_table :touristareas do |t|
      t.string :name
      t.string :address
      t.string :phone_number
      t.string :introduce
      t.boolean :status
      t.references :user, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
