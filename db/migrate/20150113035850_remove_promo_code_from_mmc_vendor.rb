class RemovePromoCodeFromMmcVendor < ActiveRecord::Migration
  def change
    remove_column :mmc_vendors, :promo_code_id 
  end
end
