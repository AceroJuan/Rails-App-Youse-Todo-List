class CreateLists < ActiveRecord::Migration[5.2]
  def change
    create_table :lists do |t|
      t.string :list_name,  null: false, default: ""
      t.text :description,  null: false, default: ""
      t.references :user, foreign_key: true

      t.timestamps null: false
    end
  end
end
