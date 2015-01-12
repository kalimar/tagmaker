class CreatePcChannels < ActiveRecord::Migration
  def change
    create_table :pc_channels do |t|
      t.string :name
      t.references :pc_department, index: true

      t.timestamps null: false
    end
    add_foreign_key :pc_channels, :pc_departments
  end
end
