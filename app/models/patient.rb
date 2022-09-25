class Patient < User
  has_many :consultations
  has_many :doctors, through: :consultations
  has_one_attached :avatar
end
