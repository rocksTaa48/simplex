class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table(:orders) do |t|
      t.belongs_to(:cart, null: false, foreign_key: true, index: true)
      t.belongs_to(:item, null: false, foreign_key: true, index: true)
      t.integer(:quantity, null: false)
      t.string(:aasm_state, null: false)
      t.timestamps
    end
  end
end
