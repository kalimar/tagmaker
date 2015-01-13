class AddMmcItemToPromoCode < ActiveRecord::Migration
  def change
    add_reference :promo_codes, :mmc_item, index: true
    add_foreign_key :promo_codes, :mmc_items
  end
end
