class MmcItem < ActiveRecord::Base
  belongs_to :mmc_placement

  # attr_accessible :name, :mmc_placement_id, :mmc_placement
end
