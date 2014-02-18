module AppointmentsHelper
  def doctors_list
    doctors = User.doctors
    doctors.map {|doctor| [doctor.name, doctor.id]}
  end
end
