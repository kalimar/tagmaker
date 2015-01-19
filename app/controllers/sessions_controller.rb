class SessionsController < ApplicationController

  def index
    session[:promo_codes] = []
  end

  def show
    @promo_codes = []
    session[:promo_codes].each { |promo_code| @promo_codes << PromoCode.find(promo_code['id']) }

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

  def snippet
      
  end
end
