class CreatePreparations < ActiveRecord::Migration[5.0]
  def change
    create_table :preparations do |t|
      t.belongs_to :ingredient, index: true
      t.belongs_to :recipe, index: true
      t.float :quantity
      t.string :method

      t.timestamps
    end
  end
end
