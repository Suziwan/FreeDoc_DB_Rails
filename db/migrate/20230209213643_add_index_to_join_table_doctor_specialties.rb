class AddIndexToJoinTableDoctorSpecialties < ActiveRecord::Migration[7.0]
  def change
    add_reference :join_table_doctor_specialties, :doctor, foreign_key: true
    add_reference :join_table_doctor_specialties, :specialty, foreign_key: true
  end
end
