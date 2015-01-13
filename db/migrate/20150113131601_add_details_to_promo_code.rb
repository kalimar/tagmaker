class AddDetailsToPromoCode < ActiveRecord::Migration
  def change
    add_column :promo_codes, :notes, :text
    add_column :promo_codes, :reporting_channel, :string
    add_column :promo_codes, :mmc_code, :string
    add_column :promo_codes, :tracking_url, :string
    add_column :promo_codes, :primary_tracking_code, :string
  end
end
