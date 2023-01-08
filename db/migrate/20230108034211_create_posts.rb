class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :account_name
      t.references :mountain_list, null: false, foreign_key: true

      t.timestamps
    end
  end
end
