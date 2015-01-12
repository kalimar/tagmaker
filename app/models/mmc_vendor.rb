class MmcVendor < ActiveRecord::Base
  belongs_to :promo_code

  has_many :mmc_categories
  has_many :mmc_placements, :through => :mmc_categories
  has_many :mmc_items, :through => :mmc_placements

  # attr_accessible :promo_code_id, :name, :promo_code
end
