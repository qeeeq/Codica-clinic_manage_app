require 'rails_helper'

RSpec.feature 'Doctor management', type: :feature do
  let(:doctor) { FactoryBot.create(:doctor) }
  let(:patient) { FactoryBot.create(:patient) }
  let(:consultation) { FactoryBot.create(:consultation, doctor_id: doctor.id, patient_id: patient.id) }

  scenario 'Login flow' do
    visit "/"
    fill_in 'Title', with: "#{doctor.phone}"
    fill_in 'Password', with: "#{doctor.password}"
    click_button 'Login'
    expect(page).to have_text('Welcome Doctor')
  end

  scenario 'Doctor can edit consultation note and it closes automatically' do
    find("a[href='/consultations']").click
    find("a[href='/consultations/#{consultation.id}/edit']").click
    fill_in 'Note', :with => "10_symbolss"
    click_button 'Update Consultation'
    expect(page).to include 'Consultation was successfully updated.'
  end
end
