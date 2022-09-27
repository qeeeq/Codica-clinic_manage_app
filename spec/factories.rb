FactoryBot.define do
  factory(:patient) do
    phone {Faker::PhoneNumber.cell_phone_in_e164}
    password {Faker::Number.number(digits: 9).to_s}
  end

  factory(:doctor) do
    phone {Faker::PhoneNumber.cell_phone_in_e164}
    password {Faker::Number.number(digits: 9).to_s}
  end
end
