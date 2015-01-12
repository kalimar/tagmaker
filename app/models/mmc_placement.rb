class MmcPlacement < ActiveRecord::Base
  belongs_to :mmc_category

  has_many :mmc_items

  # attr_accessible :mmc_category_id, :name, :mmc_category
end
