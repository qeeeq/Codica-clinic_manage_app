class ConsultationsByDoctorCountValidator < ActiveModel::Validator
  
  MAX_NUMBER_OF_CONSULTATIONS = 10

  def validate(record)
    if record.doctor.consultations.count >= MAX_NUMBER_OF_CONSULTATIONS
      record.errors.add(:base, "Doctor has more than #{MAX_NUMBER_OF_CONSULTATIONS} active consultations")
    end
  end
end
