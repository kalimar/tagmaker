class CreateMmcVendors < ActiveRecord::Migration
  def change
    create_table :mmc_vendors do |t|
      t.references :promo_code, index: true

      t.timestamps null: false
    end
    add_foreign_key :mmc_vendors, :promo_codes
  end
end
