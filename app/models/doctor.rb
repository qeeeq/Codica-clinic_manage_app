class Doctor < User
  has_many :consultations
  has_many :patients, through: :consultations

  has_many :doctor_categories
  has_many :categories, through: :doctor_categories
end
