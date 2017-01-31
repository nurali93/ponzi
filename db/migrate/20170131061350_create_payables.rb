class CreatePayables < ActiveRecord::Migration[5.0]
  def change
    create_table :payables do |t|
      t.references :user, foreign_key: true
      t.references :offer, foreign_key: true
      t.integer :amount
      t.boolean :paid

      t.timestamps
    end
  end
end
