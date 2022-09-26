# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    if user.admin?
      can :manage, :all
    end

    if user.doctor?
      can :read, ActiveAdmin::Page, name: "Dashboard"
      can :read, Doctor, id: user.id
      can [:read, :update], Consultation, doctor_id: user.id
      can :read, Patient, consultations: { doctor: { id: user.id }, closed: false }
    end

    if user.patient?
      can :read, ActiveAdmin::Page, name: "Dashboard"
      can :read, Doctor
      can :read, Category
      can [:read, :update], Patient, id: user.id
      can [:read, :create], Consultation, patient_id: user.id
    end
  end
end
