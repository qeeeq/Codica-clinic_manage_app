require "rails_helper"

RSpec.describe "Consultation", type: :request do
  it "creates a Consultation and redirects to the consultation's page" do
    sign_in Admin.create!(phone: '1231231231', password: '123123')
    doctor = Doctor.create(phone: '1231233211', password: '123123')
    patient = Patient.create(phone: '1231233219', password: '123123')
    get "/consultations/new"
    expect(response).to render_template(:new)

    post "/consultations", params: { consultation: { doctor_id: doctor.id, patient_id: patient.id } }

    expect(response).to redirect_to(assigns(:consultation))
    follow_redirect!

    expect(response).to render_template(:show)
    expect(response.body).to include("Consultation was successfully created.")
  end
end
