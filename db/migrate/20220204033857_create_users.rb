class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users, id: :uuid do |t|
      t.string :name
      t.string :display_name
      t.string :email
      t.string :photo_url
      t.string :website
      t.text   :social, array: true, default: []

      t.timestamps
    end
  end
end
