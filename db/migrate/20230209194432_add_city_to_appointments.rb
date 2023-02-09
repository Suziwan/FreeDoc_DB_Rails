class AddCityToAppointments < ActiveRecord::Migration[7.0]
  def change
    add_column :appointments, :city_id, :integer
  end
end
