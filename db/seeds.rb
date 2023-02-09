# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

Appointment.destroy_all
Doctor.destroy_all
Patient.destroy_all

specialties = ['Anesthesiologist', 'Dentist', 'Dermatologist', 'Neurologist', 'Ophthalmologist', 'Psychiatrist', 'Radiologist', 'Surgeon']

10.times do
  d = Doctor.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, specialty: specialties.sample, zip_code: Faker::Address.zip_code)
end

10.times do
  p = Patient.create!(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name)
end

5.times do
  a = Appointment.new
  a.date = Faker::Date.between(from: 2.days.ago, to: Date.today)
  a.doctor = Doctor.all.sample
  a.patient = Patient.all.sample
  a.save
end
