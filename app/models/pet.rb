class Pet < ActiveRecord::Base
  PET_TYPES = %w[dog cat bird]

  validates :pet_type, inclusion: Pet::PET_TYPES, presence: true
  validates :breed, length: { in: 3..35 }
  validates :name, length: { in: 3..35 }

  validates_presence_of :age, :weight, :date_last_visit
end
