class PromoCodesController < ApplicationController

  def index
    @mmc_vendors = MmcVendor.all
    @mmc_categories = MmcCategory.all
    @mmc_placements = MmcPlacement.all
    @mmc_items = MmcItem.all
    @pc_departments = PcDepartment.all
    @pc_channels = PcChannel.all
    @pc_programs = PcProgram.all
  end

  def create
    PromoCode.create(promo_code_params)
  end

  def update_mmc_categories
    mmc_vendor = MmcVendor.find(params[:mmc_vendors_id])
    @mmc_categories = mmc_vendor.mmc_categories.map{ |c| [c.name, c.id]}.insert(0, "Select MMC Category")
    @mmc_placements = mmc_vendor.mmc_placements.map{ |p| [p.name, p.id]}.insert(0, "Select MMC Placement")
    @mmc_items = mmc_vendor.mmc_items.map { |i| [i.name, i.id]}.insert(0, "Select MMC Item")

    respond_to do |format|
      format.html
      format.js
    end
  end

  def update_mmc_placements
    mmc_category = MmcCategory.find(params[:mmc_categories_id])
    @mmc_placements = mmc_category.mmc_placements.map{ |p| [p.name, p.id]}.insert(0, "Select placement")
    @mmc_items = mmc_category.mmc_items.map{ |i| [i.name, i.id]}.insert(0, "Select item")

    respond_to do |format|
      format.html
      format.js
    end
  end

  def update_mmc_items
    mmc_placement = MmcPlacement.find(params[:mmc_placements_id])
    @mmc_items = mmc_placement.mmc_items.map { |i| [i.name, i.id]}.insert(0, "Select item")

    respond_to do |format|
      format.html
      format.js
    end
  end

  def update_pc_channels
    pc_department = PcDepartment.find(params[:pc_departments_id])
    @pc_channels = pc_department.pc_channels.map{ |c| [c.name, c.id]}.insert(0, "Select PC Channel")
    @pc_programs = pc_department.pc_programs.map{ |p| [p.name, p.id]}.insert(0, "Select PC Program")
  end

  def update_pc_programs
    pc_channel = PcChannel.find(params[:pc_channels_id])
    @pc_programs = pc_channel.pc_programs.map{ |p| [p.name, p.id]}.insert(0, "Select PC Program")
  end

  def promo_code_params
    params.require(:promo_code).permit(:friendly_name, :base_url)
  end
end
