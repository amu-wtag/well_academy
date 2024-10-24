class AddUniqueConstraintAndNotNullToCategories < ActiveRecord::Migration[7.2]
  def up
    change_column_null :categories, :description, false
    add_index :categories, :name, unique: true
  end

  def down
    remove_index :categories, :name
    change_column_null :categories, :description, true
  end
end
