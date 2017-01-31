class CreateOffers < ActiveRecord::Migration[5.0]
  def change
    create_table :offers do |t|
      t.references :user, foreign_key: true
      t.integer :price
      t.integer :percentage
      t.string :code, index: true

      t.timestamps
    end
  end
end
