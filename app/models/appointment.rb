class Appointment < ActiveRecord::Base
  belongs_to :pet
  belongs_to :user
  
  validates_presence_of :pet, :reason_for_visit, :customer, :date_of_visit, :user

  validate :valid_date_of_visit

  private
  def valid_date_of_visit
    if Date.today >= date_of_visit.to_date
      errors.add(:base, "Date of visit cannot be in the past")
    end
  end

end
