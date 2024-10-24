class CreateOptions < ActiveRecord::Migration[7.2]
  def change
    create_table :options do |t|
      t.references :question, null: false, foreign_key: true
      t.text :option_text, null: false
      t.boolean :is_correct, default: false

      t.timestamps
    end
  end
end
