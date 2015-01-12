class MmcPlacement < ActiveRecord::Base
  belongs_to :mmc_category

  has_many :mmc_items
end
