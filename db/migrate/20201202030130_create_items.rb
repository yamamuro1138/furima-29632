class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|

      t.timestamps
      t.string :name,              null: false
      t.text :explanation,         null: false
      t.integer :price,            null: false
      t.references :user,          foreign_key: true
    end
  end
end
