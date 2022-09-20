ActiveAdmin.register DoctorCategory , namespace: false do
  permit_params :name

  index do
    selectable_column
    id_column
    column :name
    # column :doctors
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :name
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs do
      f.input :name
      f.input :doctors, :as => :select, :collection => Doctor.all.collect {|doctor| [doctor.phone, doctor.id] }
    end
    f.actions
  end
end
