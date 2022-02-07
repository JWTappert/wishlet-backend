class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items, id: :uuid do |t|
      t.string :name
      t.text :description
      t.string :link
      t.references :wishlist, null: false, foreign_key: true, type: :uuid
      t.string :photo

      t.timestamps
    end
  end
end
