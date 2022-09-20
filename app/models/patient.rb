class Patient < User
  has_many :consultations
  has_many :doctors, through: :consultations
end
