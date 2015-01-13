class AddMmcVendorToPromoCode < ActiveRecord::Migration
  def change
    add_reference :promo_codes, :mmc_vendor, index: true
    add_foreign_key :promo_codes, :mmc_vendors
  end
end
