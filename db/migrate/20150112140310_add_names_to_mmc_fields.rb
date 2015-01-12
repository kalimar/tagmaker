class AddNamesToMmcFields < ActiveRecord::Migration
  def up
    add_column :mmc_categories, :name, :string
    add_column :mmc_vendors, :name, :string
  end

  def down
    remove_column :mmc_categories, :name
    remove_column :mmc_vendors, :name
  end
end
