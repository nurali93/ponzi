class CreatePayments < ActiveRecord::Migration[5.0]
  def change
    create_table :payments do |t|
      t.references :user, foreign_key: true
      t.references :payable, foreign_key: true
      t.integer :status
      t.string :gateway
      t.jsonb :details
      t.string :code, index: true

      t.timestamps
    end
  end
end
