# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the user here. For example:
    #
    # return unless user.present?
    #   can :read, :all
    #   return unless user.admin?
    #   can :manage, :all
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, published: true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/blob/develop/docs/define_check_abilities.md
    # can :manage, User
    # can :read, User
    # can :manage, User, id: user.id
    # can :manage, :all
    # can :read, ActiveAdmin::Page, name: "Dashboard", namespace_name: "admin"

    if user.admin?
      can :manage, :all
    end

    if user.doctor?
      can :read, ActiveAdmin::Page, name: "Dashboard"
      # can :read, Patient, id: user.id
      can :read, Doctor, id: user.id
      can :read, Consultation, doctor_id: user.id
      can :update, Consultation, doctor_id: user.id, active: true
      can :read, Patient, consultations: { doctor: { id: user.id }, active: true }
    end

    if user.patient?
      can :read, ActiveAdmin::Page, name: "Dashboard"
      can :read, Doctor
      can :read, Patient, id: user.id
      can [:read, :create], Consultation, patient_id: user.id
    end
  end
end
