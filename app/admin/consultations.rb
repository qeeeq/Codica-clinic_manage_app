ActiveAdmin.register Consultation do
  permit_params :note, :patient_id, :doctor_id

  index do
    selectable_column
    if current_user.admin?
      id_column
      column :created_at
    end

    # column 'doctor' do |consultation|
    #   Doctor.all.consultations.find(consultation.id).phone
    # end

    # column 'patient' do |consultation|
    # end

    column :closed
    actions
  end

  show do
    attributes_table do
      row :doctor_id
      row :note
      row :closed
    end
    active_admin_comments
  end

  # filter :phone
  # filter :current_sign_in_at
  # filter :sign_in_count
  # filter :created_at

  form do |f|
    f.inputs "Select doctor" do
      if current_user.doctor?
        f.input :note
      end

      if current_user.patient?
        f.input :doctor, :as => :select, :collection => Doctor.all.collect {
          |doctor| ["#{doctor.phone}, (#{ doctor.categories.pluck(:name).join(', ') })", doctor.id]
        }
        f.input :patient, :input_html => { :value => current_user.id }, as: :hidden
      end

      if current_user.admin?
        f.input :doctor, :as => :select, :collection => Doctor.all.collect {
          |doctor| ["#{doctor.phone}, (#{ doctor.categories.pluck(:name).join(', ') })", doctor.id]
        }
        f.input :patient, :as => :select, :collection => Patient.all.pluck(:phone, :id)
      end
    end
    f.actions
  end
end
