class MmcCategory < ActiveRecord::Base
  belongs_to :mmc_vendor

  has_many :mmc_placements
  has_many :mmc_items, :through => :mmc_placements

  # attr_accessible :name, :mmc_vendor_id, :mmc_vendor

end
