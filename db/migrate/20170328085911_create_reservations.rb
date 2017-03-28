class CreateReservations < ActiveRecord::Migration[5.0]
  def change
    create_table :reservations do |t|
      user_id
      listing_id
      start_date
      end_date
      t.timestamps
    end
  end
end
