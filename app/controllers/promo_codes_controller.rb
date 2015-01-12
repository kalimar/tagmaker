class PromoCodesController < ApplicationController

  def index
    @mmc_vendors = MmcVendors.all
    @mmc_categories = MmcCategories.all
    @mmc_placements = MmcPlacements.all
    @mmc_items = MmcItems.all
  end

  def create
    PromoCode.create(promo_code_params)
  end

  def update_mmc_categories
    mmc_vendor = MmcVendor.find(params[:mmc_vendor_id])
    @mmc_categories = mmc_vendor.mmc_categories.map{ |c| [c.name, c.id]}.insert(0, "Select MMC Category")
    @mmc_placements = mmc_vendor.mmc_placements.map{ |p| [p.name, p.id]}.insert(0, "Select MMC Placement")
    @mmc_items = mmc_vendor.mmc_items.map { |i| [i.name, i.id]}.insert(), "Select MMC Item")
  end

  def update_mmc_placements
    mmc_category = MmcCategory.find(params[:mmc_category_id])
    @mmc_placements = mmc_category.mmc_placements.map{ |p| [p.name, p.id]}.insert(0, "Select placement")
    @mmc_items = mmc_category.mmc_items.map{ |i| [i.name, i.id]}.insert(0, "Select item")
  end

  def update_mmc_items
    mmc_placement = MmcPlacement.find(params[:mmc_placement_id])
    @mmc_items = mmc_placement.mmc_items.map { |i| [i.name, i.id]}.insert(0, "Select item")
  end

  def promo_code_params
    params.require(:promo_code).permite(:friendly_name, :base_url)
  end
end
