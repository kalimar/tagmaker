class PromoCode < ActiveRecord::Base
  has_one :mmc_vendor
  has_one :mmc_category
  has_one :mmc_placement
  has_one :mmc_item
  has_one :pc_department
  has_one :pc_channel
  has_one :pc_program
end
