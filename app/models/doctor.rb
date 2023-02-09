class Doctor < ApplicationRecord
  has_many :appointments
  has_many :patients, through: :appointments
  has_many :join_table_doctors_specialties
  has_many :patients, through: :join_table_doctors_specialties
end
