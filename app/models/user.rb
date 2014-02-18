class User < ActiveRecord::Base
  devise :database_authenticatable, 
         :recoverable, :rememberable, :validatable

  ROLES = %w[admin doctor receptionist]

  validates :role, inclusion: User::ROLES, presence: true
  validates :name, length: { in: 3..35 }
  validates :zip, length: { maximum: 5 }
  validates :years_in_practice, inclusion: { in: (1..100).to_a }
end
