class AddCityToPatients < ActiveRecord::Migration[7.0]
  def change
    add_column :patients, :city_id, :integer
  end
end
