ActiveAdmin.register Doctor , namespace: false do
  permit_params :type, :phone, :password, :password_confirmation, category_ids: []

  index do
    selectable_column
    column :phone
    column :categories
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
      row :categories
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
      f.input :categories, :as => :check_boxes
      # f.inputs do
      #   f.has_many :consultations, heading: 'Consultations',
      #                           allow_destroy: true,
      #                           new_record: false do |a|
      #     a.input :note
      #   end
      if f.object.new_record?
        f.input :password
        f.input :password_confirmation
      end
    end
    f.actions
  end
end
