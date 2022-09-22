ActiveAdmin.register Consultation do
  permit_params :note, :patient_id, :doctor_id

  index do
    selectable_column
    id_column
    column :note
    column :doctor
    column :patient_id
    column :created_at
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
      # f.input :doctor, :as => :select, :collection => Doctor.all.collect {|doctor| [doctor.phone, doctor.id] }
      # f.input :doctor, :as => :select, :collection => Doctor.all.collect {|doctor| [doctor.phone, doctor.id] }
      if current_user.doctor?
        f.input :note
      end
      if current_user.patient?
        f.input :doctor, :as => :select, :collection => Doctor.all.collect {|doctor| [doctor.phone, doctor.id] }
      end
      f.input :patient, :input_html => { :value => current_user.id }, as: :hidden
    end
    f.actions
  end
end
