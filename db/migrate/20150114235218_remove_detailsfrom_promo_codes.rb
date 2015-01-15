class RemoveDetailsfromPromoCodes < ActiveRecord::Migration
  def change
    remove_column :promo_codes, :reporting_channel
    remove_column :promo_codes, :mmc_code
    remove_column :promo_codes, :primary_tracking_code
    remove_column :promo_codes, :promo_code
  end
end
