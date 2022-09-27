FactoryBot.define do

  factory :doctor do
    phone { Faker::PhoneNumber.cell_phone_in_e164 }
    password { Faker::Number.number(digits: 9).to_s }
  end

  factory :patient do
    phone { Faker::PhoneNumber.cell_phone_in_e164 }
    password { Faker::Number.number(digits: 9).to_s }
  end

  factory :consultation do
    doctor
    patient
  end
end
