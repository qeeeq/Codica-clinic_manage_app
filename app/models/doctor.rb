class Doctor < User
  has_many :consultations
  has_many :patients, through: :consultations

  # belongs_to :category, class_name: DoctorCategory.name
end
