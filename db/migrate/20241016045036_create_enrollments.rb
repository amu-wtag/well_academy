class CreateEnrollments < ActiveRecord::Migration[7.2]
  def change
    create_table :enrollments do |t|
      t.references :student, null: false, foreign_key: { to_table: :users }
      t.references :course, null: false, foreign_key: true
      t.timestamp :enrolled_at, default: -> { 'CURRENT_TIMESTAMP' }
      t.decimal :progress, precision: 10, scale: 2, default: 0.0
      t.integer :completion_status, null: false, default: 0  # For enum

      t.timestamps
    end
  end
end
