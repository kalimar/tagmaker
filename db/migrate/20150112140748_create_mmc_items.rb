class CreateMmcItems < ActiveRecord::Migration
  def change
    create_table :mmc_items do |t|
      t.string :name
      t.references :mmc_placement, index: true

      t.timestamps null: false
    end
    add_foreign_key :mmc_items, :mmc_placements
  end
end
