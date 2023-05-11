class Ability
  include CanCan::Ability

  def initialize(user)
    if user.has_role? :junior_hr
      can :create, Candidate
      can :show, Candidate
      can :index, Candidate
      can :edit, Candidate
      can :show_cities, Candidate
      can :create, Comment
      can :show_states, Candidate
      can :create, Comment
      can :filter, Candidate
      can :skill, Candidate
      can :manage, Notification
      can :manage, SkillSet
      can :index, InterviewSchedule
      can :user_leads, Lead

    elsif user.has_role? :senior_hr
      can :index, Candidate
      can :show, Candidate
      can :edit, Candidate
      can :create, Comment
      can :filter, Candidate
      can :skill, Candidate
      can :manage, Notification
      can :manage, SkillSet
      can :index, InterviewSchedule
      
    elsif user.has_role? :bde
      can :index, Candidate
      can :show,  Candidate
      can :create, Comment
      can :filter, Candidate
      can :skill, Candidate
      can :manage, SkillSet
      can :index, InterviewSchedule

    elsif user.has_role? :admin
      can :manage, :all

    elsif user.has_role? :sales_person
      can :manage, Lead
      can :manage, Notification
      can :show, Candidate
      can :index, InterviewSchedule

    elsif user.has_role? :pool_manager
      can :index, InterviewSchedule
      can :manage, Notification

    elsif user.has_role? :manager
      can :manage, :all
      
    end
  end
end
  