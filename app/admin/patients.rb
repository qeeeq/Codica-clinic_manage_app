ActiveAdmin.register Patient , namespace: false do
  permit_params :type, :phone, :password, :password_confirmation

  index do
    selectable_column
    column :phone
    if current_user.admin?
      id_column
      column :current_sign_in_at
      column :sign_in_count
      column :created_at
    end
    actions
  end

  show do
    attributes_table do
      row :phone
      row :email
    end
    active_admin_comments
  end

  filter :phone
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs do
      f.input :phone
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end
end


