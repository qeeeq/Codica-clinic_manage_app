ActiveAdmin.register Patient, namespace: false do
  permit_params :type, :phone, :password, :password_confirmation, :avatar

  show do
    attributes_table do
      row :phone
      row :email
      row "Avatar" do |patient|
        cl_image_tag url_for(patient.avatar)
      end
    end
  end

  form do |f|
    f.inputs do
      f.input :phone
      f.input :avatar, as: :file
      if f.object.new_record?
        f.input :password
        f.input :password_confirmation
      end
    end
    f.actions
  end
end
