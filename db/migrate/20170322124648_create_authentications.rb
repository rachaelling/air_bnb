class CreateAuthentications < ActiveRecord::Migration[5.0]
  def change
    create_table :authentications do |t|
      t.string :uid
      t.string :provider
      t.string :token
      t.integer :user_id

      t.timestamps
    end
  end
end
