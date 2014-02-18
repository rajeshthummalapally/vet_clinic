class AppointmentsController < ApplicationController
  skip_before_filter :authorize_user!, only: [:index]
  before_filter :ensure_user_can_manage_appointments, only: [:new, :edit, :update, :create, :destroy]
  before_action :set_pets
  before_action :set_appointment, only: [:show, :edit, :update, :destroy]

  def index
    @appointments = Appointment.all.includes(:user, :pet)
  end

  def show
  end

  def new
    @appointment = Appointment.new
  end

  def edit
  end

  def create
    @appointment = Appointment.new(appointment_params)

    respond_to do |format|
      if @appointment.save
        format.html { redirect_to @appointment, notice: 'Appointment was successfully created.' }
        format.json { render action: 'show', status: :created, location: @appointment }
      else
        format.html { render action: 'new' }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @appointment.update(appointment_params)
        format.html { redirect_to @appointment, notice: 'Appointment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @appointment.destroy
    respond_to do |format|
      format.html { redirect_to appointments_url }
      format.json { head :no_content }
    end
  end

  private
    def set_appointment
      @appointment = Appointment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def appointment_params
      params.require(:appointment).permit(:date_of_visit, :customer, :requires_reminder, :reason_for_visit, :pet_id, :user_id)
    end

   def set_pets
     @pets = Pet.all
   end

   def ensure_user_can_manage_appointments
      unless current_user.receptionist? || current_user.admin?
        flash[:notice] = "You do not have proper permissions"
	redirect_to appointments_path unless current_user.receptionist?
      end
   end
end
