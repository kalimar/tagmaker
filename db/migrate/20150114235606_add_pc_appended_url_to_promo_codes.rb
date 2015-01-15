class AddPcAppendedUrlToPromoCodes < ActiveRecord::Migration
  def change
    add_column :promo_codes, :pc_appended_url, :string
  end
end
