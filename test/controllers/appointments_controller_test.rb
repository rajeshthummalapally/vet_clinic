require 'test_helper'

class AppointmentsControllerTest < ActionController::TestCase
  fixtures :pets, :users
  setup do
    @appointment = appointments(:bella_appointment)
  end

  test "should get index" do
    sign_in(users(:receptionist_beth))
    get :index
    assert_response :success
    assert_not_nil assigns(:appointments)
  end

  test "should get new" do
    sign_in(users(:receptionist_beth))
    get :new
    assert_response :success
  end

  test "should create appointment" do
    sign_in(users(:receptionist_beth))
    assert_difference('Appointment.count') do
      post :create, appointment: { customer: 'Jacob', 
                                   date_of_visit: Date.today + 2.days, 
                                   reason_for_visit: "Bella not feeling well", 
                                   pet_id: pets(:bella).id,
                                   user_id: users(:doctor_robert).id,
                                   requires_reminder: true }
    end

    assert_redirected_to appointment_path(assigns(:appointment))
  end

  test "should show appointment" do
    sign_in(users(:receptionist_beth))
    get :show, id: @appointment
    assert_response :success
  end

  test "should get edit" do
    sign_in(users(:receptionist_beth))
    get :edit, id: @appointment
    assert_response :success
  end

  test "should update appointment" do
    sign_in(users(:receptionist_beth))
    patch :update, id: @appointment, appointment: { customer: @appointment.customer, 
                                                    date_of_visit: Date.today + 1.day, 
                                                    reason_for_visit: @appointment.reason_for_visit, 
                                                    pet_id: pets(:bella).id,
                                                    user_id: users(:doctor_robert).id,
                                                    requires_reminder: @appointment.requires_reminder }
    assert_redirected_to appointment_path(assigns(:appointment))
  end

  test "should destroy appointment" do
    sign_in(users(:receptionist_beth))
    assert_difference('Appointment.count', -1) do
      delete :destroy, id: @appointment
    end

    assert_redirected_to appointments_path
  end

  test "should redirect if user is a doctor and is creating an appointment" do
    sign_in(users(:doctor_robert))
    
    post :create, appointment: { customer: 'Jacob', 
                                 date_of_visit: Date.today + 2.days, 
                                 reason_for_visit: "Bella not feeling well", 
                                 pet_id: pets(:bella).id,
                                 user_id: users(:doctor_robert).id,
                                 requires_reminder: true }
    assert_redirected_to appointments_path
  end
end
