class AddMmcPlacementToPromoCode < ActiveRecord::Migration
  def change
    add_reference :promo_codes, :mmc_placement, index: true
    add_foreign_key :promo_codes, :mmc_placements
  end
end
