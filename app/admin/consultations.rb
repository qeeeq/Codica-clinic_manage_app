ActiveAdmin.register Consultation do
  permit_params :patient_id, :doctor_id

  index do
    selectable_column
    id_column
    column :doctor_id
    column :patient_id
    column :created_at
    actions
  end

  # filter :phone
  # filter :current_sign_in_at
  # filter :sign_in_count
  # filter :created_at

  # form do |f|
  #   f.inputs do
  #     f.input :phone
  #     f.input :type
  #     f.input :password
  #     f.input :password_confirmation
  #   end
  #   f.actions
  # end

  # form do |f|
  #   f.inputs "Select doctor" do
  #     f.input :doctor_id, as: :select, collection: Doctor.select(:phone).uniq
  #     # f.input :file
  #   end
  #   f.actions
  # end

  form do |f|
    f.inputs "Select doctor" do
      f.input :doctor, :as => :select, :collection => Doctor.all.collect {|doctor| [doctor.phone, doctor.id] }
      f.input :patient, :as => :select, :collection => Patient.all.collect {|patient| [patient.phone, patient.id] }
    end
    f.actions
  end

end
