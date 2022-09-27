class Consultation < ApplicationRecord
  include ActiveModel::Validations
  validates_with ConsultationsByDoctorCountValidator

  belongs_to :doctor
  belongs_to :patient

  validates :note, length: { minimum: 10, maximum: 100 }, allow_blank: true
  before_save :try_to_close

  private

  def try_to_close
    return if note.blank?
    return if closed?

    self.closed = true
  end
end
