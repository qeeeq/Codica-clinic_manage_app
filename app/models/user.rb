class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable, and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable, :registerable

  validates :phone, presence: true, numericality: true, length: { minimum: 9, maximum: 12 }
  
  before_save :patient_sign_up

  def patient_sign_up
    self.type ||= 'Patient'
  end

  def name
    phone
  end

  def admin?
    is_a?(Admin)
  end

  def doctor?
    is_a?(Doctor)
  end

  def patient?
    is_a?(Patient)
  end

  def email_required?
    false
  end
end
