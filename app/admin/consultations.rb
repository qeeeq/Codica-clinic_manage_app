ActiveAdmin.register Consultation do
  # permit_params :type, :phone, :password, :password_confirmation

  # index do
    # selectable_column
    # id_column
    # column :phone
    # column :type
    # column :current_sign_in_at
    # column :sign_in_count
    # column :created_at
    # actions
  # end

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
    end
    f.actions
  end

end
