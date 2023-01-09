class CreateMountains < ActiveRecord::Migration[7.0]
  def change
    create_table :mountains do |t|
      t.string :kana
      t.string :mountain_name
      t.string :prefecture
      t.integer :elevation
      t.string :latitude
      t.string :longitude

      t.timestamps
    end
  end
end
