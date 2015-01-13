class AddMmcCategoryToPromoCode < ActiveRecord::Migration
  def change
    add_reference :promo_codes, :mmc_category, index: true
    add_foreign_key :promo_codes, :mmc_categories
  end
end
