class RenameEndEndToEndDateInBookings < ActiveRecord::Migration[7.1]
  def change
    rename_column :bookings, :end_end, :end_date
  end
end
