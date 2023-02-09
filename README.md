# FreeDoc

Project nº1 using Ruby on Rails, and databases with Active Record

## Seed file

Simply run the seed file using $ rails db:seed.
Here below is a description of the seed content :

### Faker gem
´´´ruby
require 'faker'
´´´

### Clean-up of the database
City.destroy_all
Appointment.destroy_all
JoinTableDoctorSpecialty.destroy_all
Doctor.destroy_all
Patient.destroy_all
Specialty.destroy_all 

### Creation of arrays and tables for specialties and cities
array_specialties = ['Anesthesiologist', 'Dentist', 'Dermatologist', 'Neurologist', 'Ophthalmologist', 'Psychiatrist', 'Radiologist', 'Surgeon']
array_cities = ['New York', 'Los Angeles', 'Chicago', 'Houston', 'Phoenix', 'Philadelphia', 'San Antonio', 'San Diego']

array_cities.each do |city| 
  c = City.create!(name: city)
end

array_specialties.each do |specialty| 
  s = Specialty.create!(profession: specialty)
end

### Creation of doctors table
10.times do
  d = Doctor.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, zip_code: Faker::Address.zip_code, city_id: City.all.sample.id, specialty_id: Specialty.all.sample.id)
end

### Creation of patients table
10.times do
  p = Patient.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, city_id: City.all.sample.id)
end

### Creation of appointments table
5.times do
  a = Appointment.new
  a.date = Faker::Date.between(from: 2.days.ago, to: Date.today)
  a.doctor = Doctor.all.sample
  a.patient = Patient.all.sample
  a.city_id = City.all.sample.id
  a.save
end

### Creation of join table for doctors/specialties relation
5.times do
  j = JoinTableDoctorSpecialty.new
  j.doctor_id = Doctor.all.sample.id
  j.specialty_id = Specialty.all.sample.id
  j.save
end

## 
