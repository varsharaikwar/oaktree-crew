class Ability
  include CanCan::Ability

  def initialize(user)
    if user.has_role? :junior_hr
      can :create, Candidate
      can :show, Candidate
      can :index, Candidate
      can :edit, Candidate

    elsif user.has_role? :senior_hr
      can :index, Candidate
      can :show, Candidate
      can :edit, Candidate

    elsif user.has_role? :bde
      can :index, Candidate
      can :show, Candidate

    elsif user.has_role? :admin
      can :manage, :all
    end
  end
  
end
