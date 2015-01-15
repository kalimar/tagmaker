class PromoCode < ActiveRecord::Base
  has_one :mmc_vendor
  has_one :mmc_category
  has_one :mmc_placement
  has_one :mmc_item
  has_one :pc_department
  has_one :pc_channel
  has_one :pc_program

  def mmc_code_builder
    mmc_code = ""
    mmc_code += self.url_has_params? ? "&" : "?"
    mmc_code += "cm_mmc="
    mmc_code += "#{MmcVendor.find(self.mmc_vendor_id).name}"
    mmc_code += "-_-"
    mmc_code += "#{MmcCategory.find(self.mmc_category_id).name}"
    mmc_code += "-_-"
    mmc_code += "#{MmcPlacement.find(self.mmc_placement_id).name}"
    mmc_code += "-_-"
    mmc_code += "#{MmcItem.find(self.mmc_item_id).name}"
  end
  def url_has_params?
    /\?/.match(self.base_url)
  end
end
