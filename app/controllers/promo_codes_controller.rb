class PromoCodesController < ApplicationController
  def create
    PromoCode.create(promo_code_params)
  end

  def promo_code_params
    params.require(:promo_code).permite(:friendly_name, :base_url)
  end
end
