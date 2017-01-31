class CreateTransactions < ActiveRecord::Migration[5.0]
  def change
    create_table :transactions do |t|
      t.references :from, polymorphic: true
      t.references :to, polymorphic: true
      t.integer :amount

      t.timestamps
    end
  end
end
