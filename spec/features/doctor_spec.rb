require 'rails_helper'

RSpec.feature 'Doctor management', type: :feature do
  let(:doctor) { Doctor.create(phone: '03214569877', password: '123123') }
  let(:patient) { Patient.create(phone: '02214555877', password: '123123') }
  let(:consultation) { patient.consultations.create(doctor_id: doctor.id) }

  scenario 'Wrong login information' do
    visit "/"
    click_button 'Login'

    expect(page).to have_text("Invalid Phone or password.")
  end

  scenario 'Doctor login' do
    visit "/"
    fill_in 'Title', with: doctor.phone.to_s
    fill_in 'Password', with: doctor.password.to_s
    click_button 'Login'

    expect(page).to have_text('Welcome Doctor')
  end

  # scenario 'Doctor login' do
  #   visit "/"
  #   fill_in 'Title', with: "#{doctor.phone}"
  #   fill_in 'Password', with: "#{doctor.password}"
  #   click_button 'Login'
  #   find("a[href='/consultations']").click

  #   # expect(page).to have_link(nil, href: "/consultations/#{non_closed_consultation.id}/edit")
  #   # page.should have_selector(:link_or_button, "/consultations/#{non_closed_consultation.id}/edit")
  #   expect(page).to have_selector(:link_or_button, "/consultations/#{consultation.id}/edit")
  # end
end
