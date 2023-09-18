class CreateSubcategories < ActiveRecord::Migration[7.0]
  def change
    create_table(:subcategories) do |t|
      t.string(:title, null: false)
      t.string(:body)
      t.belongs_to(:category, foreign_key: true, index: true, null: false)

      t.timestamps
    end
  end
end
