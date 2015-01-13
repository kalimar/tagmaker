module PromoCodesHelper
  def mmc_code_builder promo_code
    mmc_code = ""
    mmc_code += url_has_params?(promo_code.base_url) ? "&" : "?"
    mmc_code += "cm_mmc="
    mmc_code += "#{MmcVendor.find(promo_code.mmc_vendor_id).name}"
    mmc_code += "-_-"
    mmc_code += "#{MmcCategory.find(promo_code.mmc_category_id).name}"
    mmc_code += "-_-"
    mmc_code += "#{MmcPlacement.find(promo_code.mmc_placement_id).name}"
    mmc_code += "-_-"
    mmc_code += "#{MmcItem.find(promo_code.mmc_item_id).name}"
  end

  def url_has_params? base_url
    /\?/.match(base_url)
  end

  # def mmc_vendor_name mmc_vendor_id
  #   MmcVendor.find(mmc_vendor_id).name
  # end
  #
  # def mmc_mmc_category_name mmc_category_id
  #   MmcCategory.find(mmc_category_id).name
  # end


end
