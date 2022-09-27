class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable, and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable, :registerable

  validates :phone, presence: true, numericality: true, length: { minimum: 9, maximum: 12 }
  
  before_save :setup_default_type

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

  private

  def setup_default_type
    self.type ||= Patient.name
  end
end
