desc 'sets up the project by running migration and populating sample data'
task :setup => :environment do                                   

  Rake::Task["db:drop"].invoke
  Rake::Task["db:create"].invoke
  Rake::Task["db:migrate"].invoke
  Rake::Task["setup_sample_data"].invoke
end

desc 'Setup sample data'
task setup_sample_data: :environment do
  admin_user = User.create!(name: "Administrator", title: "Dr", email: "admin@example.com", password: "password", 
                            address: "101 no where st", city: "Gaithersburg", state: "MD", 
                            zip: "89898", school: "Syracuse University", years_in_practice: 18, role: "admin")
  doctor_robert = User.create!(name: 'Robert Smith', email: 'robert@example.com', title: 'Dr', city: 'Rockville', state: 'MD',
                               address: 'mulberry dr',  zip: 29222, school: 'Univ of Maryland', years_in_practice: 8, role: 'doctor')
  doctor_susan = User.create!(name: 'Susan Smith', email: 'susan@example.com', title: 'Dr', city: 'Bethesda', state: 'MD',
                              address: 'calvin dr',  zip: 28292, school: 'Univ of Maryland', years_in_practice: 4, role: 'doctor')
  receptionist_beth = User.create!(name: 'Beth Jones', email: 'beth@example.com', title: 'VP', city: 'Laurel', state: 'MD',
                              address: 'Diamond Ave', zip: 23383, role: 'receptionist')
 
  pet_tommy = Pet.create!(name: "Tommy", pet_type: "cat", breed: "Persian", age: "3yrs", 
                          weight: "18lbs", date_last_visit: 1.day.ago)
  pet_bella = Pet.create!(name: "Bella", pet_type: "dog", breed: "Poodle", age: 2, weight: "7lbs", date_last_visit: Date.today - 10.days)
  
  appointment = Appointment.create!(date_of_visit: Date.today + 1.day, pet_id: Pet.first.id, user: doctor_robert,
                                    customer: "Jerry", requires_reminder: true, reason_for_visit: "Regular checkup")

  puts "Sample data added"
end
