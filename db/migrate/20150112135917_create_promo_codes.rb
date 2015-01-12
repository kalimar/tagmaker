class CreatePromoCodes < ActiveRecord::Migration
  def change
    create_table :promo_codes do |t|
      t.string :base_url
      t.string :friendly_name

      t.timestamps null: false
    end
  end
end
