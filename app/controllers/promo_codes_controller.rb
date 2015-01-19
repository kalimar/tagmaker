class PromoCodesController < ApplicationController
  before_action :set_promo_code, only: [:show, :edit, :update, :destroy]

  def index
    @promo_codes = PromoCode.all
  end

  def show
  end

  def new
    @promo_codes = []
    session[:promo_codes].each { |promo_code| @promo_codes << PromoCode.find(promo_code['id']) }
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
    respond_to do |format|
      if @promo_code.save
        session[:promo_codes] << @promo_code
        format.html { redirect_to  '/sessions/new', notice: 'Promocode was successfully create.' }
      else
        format.html { redirect_to '/sessions/new', notice: 'Oops, unable to properly save promo_code'}
      end
    end
  end

  def edit
  end

  def update
    respond_to do |format|
      if @promo_code.update(pc_appended_url_params)
        format.html { redirect_to '/sessions/show', notice: 'Promocode was successfully updated.' }
      else
        format.html { redirect_to '/sessions/show', notice: 'Oops, unable to properly save promo_code'}
      end
    end
  end

  def destroy
    @promo_code.destroy
    respond_to do |format|
      format.html { redirect_to :root, notice: 'Promocode was successfully destroyed'}
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

    def pc_appended_url_params
      params.require(:promo_code).permit(:pc_appended_url)
    end

    def set_promo_code
      @promo_code = PromoCode.find(params[:id])
    end

end
