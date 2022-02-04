class CreateWishlists < ActiveRecord::Migration[6.0]
  def change
    create_table :wishlists, id: :uuid do |t|
      t.string :name
      t.uuid :user_id

      t.timestamps
    end
  end
end
