class CreateMmcCategories < ActiveRecord::Migration
  def change
    create_table :mmc_categories do |t|
      t.references :mmc_vendor, index: true

      t.timestamps null: false
    end
    add_foreign_key :mmc_categories, :mmc_vendors
  end
end
