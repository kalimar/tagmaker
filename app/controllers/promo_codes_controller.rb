class PromoCodesController < ApplicationController

  def index
  end

  def show
    @promo_code = PromoCode.find(params[:id])
  end

  def new
    @promo_code = PromoCode.new
    @mmc_vendors = MmcVendor.all
    @mmc_categories = MmcCategory.all
    @mmc_placements = MmcPlacement.all
    @mmc_items = MmcItem.all
    @pc_departments = PcDepartment.all
    @pc_channels = PcChannel.all
    @pc_programs = PcProgram.all
  end

  def create
    @promo_code = PromoCode.new(promo_code_params)

    promo_code_string = "URL MMC Department Channel Program Prefix Friendly_Name Reporting_Channel \n"
    promo_code_string += "#{@promo_code.base_url}"


    respond_to do |format|
      if @promo_code.save
        format.html { redirect_to @promo_code, notice: 'Promocode was successfully create.' }
      else
        format.html { render :new }
      end
    end
  end

  def update_mmc_categories
    mmc_vendor = MmcVendor.find(params[:mmc_vendors_id])
    @mmc_categories = mmc_vendor.mmc_categories.map{ |c| [c.name, c.id]}.insert(0, "Select MMC Category")
    @mmc_placements = mmc_vendor.mmc_placements.map{ |p| [p.name, p.id]}.insert(0, "Select MMC Placement")
    @mmc_items = mmc_vendor.mmc_items.map { |i| [i.name, i.id]}.insert(0, "Select MMC Item")
  end

  def update_mmc_placements
    mmc_category = MmcCategory.find(params[:mmc_categories_id])
    @mmc_placements = mmc_category.mmc_placements.map{ |p| [p.name, p.id]}.insert(0, "Select placement")
    @mmc_items = mmc_category.mmc_items.map{ |i| [i.name, i.id]}.insert(0, "Select item")
  end

  def update_mmc_items
    mmc_placement = MmcPlacement.find(params[:mmc_placements_id])
    @mmc_items = mmc_placement.mmc_items.map { |i| [i.name, i.id]}.insert(0, "Select item")
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

  private
    def promo_code_params
      params.require(:promo_code).permit(:friendly_name, :base_url,
                                          :mmc_vendor_id, :mmc_category_id,
                                          :mmc_placement_id, :mmc_item_id,
                                          :notes, :reporting_channel,
                                          :pc_department_id, :pc_channel_id,
                                          :pc_program_id)
    end

end
