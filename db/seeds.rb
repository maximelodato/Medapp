# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


# villes
paris = City.create(name: 'Paris')
lyon = City.create(name: 'Lyon')

# spécialités
dermatology = Specialty.create(name: 'Dermatology')
cardiology = Specialty.create(name: 'Cardiology')

# docteurs
alice = Doctor.create(first_name: 'Alice', last_name: 'Smith', city: paris)
bob = Doctor.create(first_name: 'Bob', last_name: 'Jones', city: lyon)

# Association docteurs aux spécialités
DoctorSpecialty.create(doctor: alice, specialty: dermatology)
DoctorSpecialty.create(doctor: bob, specialty: cardiology)

# patients
charlie = Patient.create(first_name: 'Charlie', last_name: 'Brown', city: paris)
dana = Patient.create(first_name: 'Dana', last_name: 'Scully', city: lyon)

# rendez-vous
Appointment.create(date: DateTime.now + 3.days, doctor: alice, patient: charlie, city: paris)
Appointment.create(date: DateTime.now + 5.days, doctor: bob, patient: dana, city: lyon)

puts "Seeds loaded successfully!"
