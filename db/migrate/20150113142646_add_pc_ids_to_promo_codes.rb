class AddPcIdsToPromoCodes < ActiveRecord::Migration
  def change
    add_column :promo_codes, :promo_code, :string
    add_reference :promo_codes, :pc_channel, index: true
    add_foreign_key :promo_codes, :pc_channels
    add_reference :promo_codes, :pc_department, index: true
    add_foreign_key :promo_codes, :pc_departments
    add_reference :promo_codes, :pc_program, index: true
    add_foreign_key :promo_codes, :pc_programs
  end
end
