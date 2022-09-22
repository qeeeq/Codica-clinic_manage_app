ActiveAdmin.register Admin , namespace: false do
  permit_params :type, :phone, :password, :password_confirmation

  # menu label: "List of admins"
  index do
    selectable_column
    id_column
    column :phone
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :phone
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs do
      f.input :phone
      f.input :type
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end
end
