class Consultation < ApplicationRecord
  include ActiveModel::Validations
  validates_with ConsultationsByDoctorCountValidator

  belongs_to :doctor
  belongs_to :patient

  validates :note, length: {minimum: 10, maximum: 100}, allow_blank: true
  before_save :validate_note

  def validate_note
    self.closed = true if note
  end
end
