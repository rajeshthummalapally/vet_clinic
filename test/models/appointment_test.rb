require 'test_helper'

class AppointmentTest < ActiveSupport::TestCase
  fixtures :pets, :users
  
  test "Validate date of visit is not in the past" do
    appointment = Appointment.create(date_of_visit: DateTime.now - 1.day, 
                                     pet: pets(:tommy), 
                                     customer: "Nancy",
                                     user: users(:doctor_robert),
                                     reason_for_visit: "Tommy not feeling good")
    assert !appointment.valid?
    assert_equal appointment.errors.full_messages.first, "Date of visit cannot be in the past"
  end 
end
