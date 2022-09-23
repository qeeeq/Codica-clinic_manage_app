# frozen_string_literal: true
ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { "Welcome #{current_user.type}" } do

    if current_user.admin?
      columns do
        column do
          panel "Admin data" do
            # some data
          end
        end
      end
    end

    if current_user.doctor?
      columns do
        column do
          panel "Info" do
            # some data
          end
        end
      end
    end

      if current_user.patient?
      columns do
        column do
          panel "Patient info" do
            # some data
          end
        end
      end
    end
    render partial: 'admin/dashboard/my_cool_form'
  end # content
end
