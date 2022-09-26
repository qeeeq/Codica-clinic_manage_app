ActiveAdmin.register Consultation do
  permit_params :note, :patient_id, :doctor_id

  form do |f|
    f.inputs 'Select doctor' do
      if current_user.doctor?
        f.input :note
      end

      if current_user.patient?
        f.input :doctor, as: :select,
                         collection: Doctor.all.collect { |doctor| ["#{doctor.phone}, (#{doctor.categories.pluck(:name).join(', ')})", doctor.id] }
        f.input :patient, input_html: { value: current_user.id }, as: :hidden
      end

      if current_user.admin?
        f.input :doctor, as: :select,
                         collection: Doctor.all.collect { |doctor| ["#{doctor.phone}, (#{doctor.categories.pluck(:name).join(', ')})", doctor.id] }
        f.input :patient, as: :select, collection: Patient.all.pluck(:phone, :id)
      end
    end
    f.actions
  end
end
