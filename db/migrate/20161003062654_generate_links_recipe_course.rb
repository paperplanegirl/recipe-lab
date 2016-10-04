class GenerateLinksRecipeCourse < ActiveRecord::Migration[5.0]
  def change
    create_join_table :recipes, :courses do |t|
      t.index :recipe_id
      t.index :course_id
    end
  end
end
