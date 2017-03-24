class CreateListings < ActiveRecord::Migration[5.0]
  def change
    create_table :listings do |t|
      t.string :title, null:false
      t.string :location, null:false
      t.text :description
      t.date :available_from, null:false
      t.date :available_to, null:false
      t.integer :capacity
      t.references :user, index: true, foreign_key: true
      t.timestamps
    end
  end
end
