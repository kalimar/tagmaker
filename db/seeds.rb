PromoCode.destroy_all
MmcVendor.destroy_all
MmcCategory.destroy_all
MmcPlacement.destroy_all
MmcItem.destroy_all
PcDepartment.destroy_all
PcChannel.destroy_all
PcProgram.destroy_all

3.times do |w|
  mmc_vendor = MmcVendor.create(name: "mmc_vendor: #{w}")
  3.times do |x|
    mmc_category = MmcCategory.create(name: "mmc_category: #{w}.#{x}", mmc_vendor:  mmc_vendor)
    3.times do |y|
      mmc_placement = MmcPlacement.create(name: "mmc_placement: #{w}.#{x}.#{y}", mmc_category: mmc_category)
      3.times do |z|
        mmc_item = MmcItem.create(name: "mmc_item: #{w}.#{x}.#{y}.#{z}", mmc_placement: mmc_placement)
      end
    end
  end
end

3.times do |x|
  pc_department = PcDepartment.create(name: "pc_department: #{x}")
  3.times do |y|
     pc_channel = PcChannel.create(name: "pc_channel: #{x}.#{y}", pc_department: pc_department)
     3.times do |z|
       pc_program = PcProgram.create(name: "pc_program: #{x}.#{y}.#{z}", pc_channel: pc_channel)
     end
  end
end
