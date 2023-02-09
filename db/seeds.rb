# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

City.destroy_all
Appointment.destroy_all # belongs_to doctor and patient
JoinTableDoctorSpecialty.destroy_all # belongs_to doctor and specialty
City.destroy_all
Doctor.destroy_all
Patient.destroy_all
Specialty.destroy_all 

array_specialties = ['Anesthesiologist', 'Dentist', 'Dermatologist', 'Neurologist', 'Ophthalmologist', 'Psychiatrist', 'Radiologist', 'Surgeon']
array_cities = ['New York', 'Los Angeles', 'Chicago', 'Houston', 'Phoenix', 'Philadelphia', 'San Antonio', 'San Diego']

array_cities.each do |city| 
  c = City.create!(name: city)
end

array_specialties.each do |specialty| 
  s = Specialty.create!(profession: specialty)
end

10.times do
  d = Doctor.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, zip_code: Faker::Address.zip_code, city_id: City.all.sample.id, specialty_id: Specialty.all.sample.id)
end

10.times do
  p = Patient.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, city_id: City.all.sample.id)
end

5.times do
  a = Appointment.new
  a.date = Faker::Date.between(from: 2.days.ago, to: Date.today)
  a.doctor = Doctor.all.sample
  a.patient = Patient.all.sample
  a.city_id = City.all.sample.id
  a.save
end

5.times do
  j = JoinTableDoctorSpecialty.new
  j.doctor_id = Doctor.all.sample.id
  j.specialty_id = Specialty.all.sample.id
  j.save
end
