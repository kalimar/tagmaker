class CreateMmcPlacements < ActiveRecord::Migration
  def change
    create_table :mmc_placements do |t|
      t.string :name
      t.references :mmc_category, index: true

      t.timestamps null: false
    end
    add_foreign_key :mmc_placements, :mmc_categories
  end
end
