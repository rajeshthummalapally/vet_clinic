module PetsHelper

  def available_pet_types
    Pet::PET_TYPES.map{ |pet_type| [pet_type.capitalize, pet_type] }
  end
end
