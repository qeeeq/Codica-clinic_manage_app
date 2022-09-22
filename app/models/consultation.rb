class Consultation < ApplicationRecord
  belongs_to :doctor
  belongs_to :patient

  validates :note, length: {minimum: 10, maximum: 100}, allow_blank: true
  before_save :validate_note


  def validate_note
    self.closed = true if note
  end
end
