class Category < ApplicationRecord
  has_many :doctor_categories
  has_many :doctors, through: :doctor_categories
  
  validates :name, presence: true
end
