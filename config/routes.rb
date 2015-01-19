Rails.application.routes.draw do

  get 'promo_codes/update_mmc_categories', :as => 'update_mmc_categories'
  get 'promo_codes/update_mmc_placements', :as => 'update_mmc_placements'
  get 'promo_codes/update_mmc_items', :as => 'update_mmc_items'
  get 'promo_codes/update_pc_channels', :as => 'update_pc_channels'
  get 'promo_codes/update_pc_programs', :as => 'update_pc_programs'

  resources :promo_codes
  resources :sessions
  root :to => "sessions#index"
end
