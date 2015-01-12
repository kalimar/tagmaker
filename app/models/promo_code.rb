class PromoCode < ActiveRecord::Base
  # attr_accessible :friendly_name, :base_url

  has_many :mmc_vendors
  has_many :mmc_categories, :through => :mmc_vendors
end
