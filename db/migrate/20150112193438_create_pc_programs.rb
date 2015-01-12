class CreatePcPrograms < ActiveRecord::Migration
  def change
    create_table :pc_programs do |t|
      t.string :name
      t.references :pc_channel, index: true

      t.timestamps null: false
    end
    add_foreign_key :pc_programs, :pc_channels
  end
end
