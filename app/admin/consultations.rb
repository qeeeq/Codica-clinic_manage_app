ActiveAdmin.register Consultation do
  permit_params :note, :patient_id, :doctor_id, :closed

  form do |f|
    if current_user.doctor?
      f.inputs 'Make a recommendation' do  
        f.input :note
        f.actions
      end
    end

    if current_user.patient?
      f.inputs 'Select doctor' do
        f.input :doctor, as: :select,
                         collection: Doctor.all.collect { |doctor| ["#{doctor.phone}, (#{doctor.categories.pluck(:name).join(', ')})", doctor.id] }
        f.input :patient, input_html: { value: current_user.id }, as: :hidden
        f.actions
      end
    end

    if current_user.admin?
      f.inputs 'Make the changes' do
        f.input :doctor, as: :select,
                         collection: Doctor.all.collect { |doctor| ["#{doctor.phone}, (#{doctor.categories.pluck(:name).join(', ')})", doctor.id] }
        f.input :patient, as: :select, collection: Patient.all.pluck(:phone, :id)
        f.input :closed
        f.actions
      end
    end
  end
end
