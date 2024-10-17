class CreateTasks < ActiveRecord::Migration[7.1]
  def change
    create_enum :status, %w[
      pending
      processing
      blocked
      removed
      completed
    ]

    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.date :due_date
      t.enum(
         :status,
         enum_type: 'status',
         default: 'pending',
         null: false
      )
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
