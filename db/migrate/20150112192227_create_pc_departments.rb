class CreatePcDepartments < ActiveRecord::Migration
  def change
    create_table :pc_departments do |t|
      t.references :promo_code, index: true
      t.string :name

      t.timestamps null: false
    end
    add_foreign_key :pc_departments, :promo_codes
  end
end
