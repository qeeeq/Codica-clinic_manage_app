class Doctor < User
  has_many :consultations
  has_many :patients, through: :consultations
end
