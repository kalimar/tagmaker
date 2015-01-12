PromoCode.destroy_all
MmcVendor.destroy_all
MmcCategory.destroy_all
MmcPlacement.destroy_all
MmcItem.destroy_all

3.times do |w|
  mmc_vendor = MmcVendor.create(name: "mmc_vendor: #{w}")
  3.times do |x|
    mmc_category = MmcCategory.create(name: "mmc_category: #{w}.#{x}", mmc_vendor:  mmc_vendor)
    3.times do |y|
      mmc_placement = MmcPlacement.create(name: "mmc_placement: #{w}.#{x}.#{y}", mmc_category: mmc_category)
      3.times do |z|
        mmc_item = MmcItem.create(name: "mmc_item: #{w}.#{x}.#{y}.#{z}", mmc_placement:mmc_placement)
      end
    end
  end
end
