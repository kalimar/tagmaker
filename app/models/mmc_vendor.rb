class MmcVendor < ActiveRecord::Base
  has_many :promo_codes
  has_many :mmc_categories
  has_many :mmc_placements, :through => :mmc_categories
  has_many :mmc_items, :through => :mmc_placements
end
