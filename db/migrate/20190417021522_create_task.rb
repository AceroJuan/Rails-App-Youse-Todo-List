class CreateTask < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :task_name,  null: false, default: ""
      t.text :description,  null: false, default: ""
      t.references :list, foreign_key: true

      t.timestamps null: false
    end
  end
end
