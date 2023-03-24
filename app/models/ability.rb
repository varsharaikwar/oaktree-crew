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
      

    elsif user.has_role? :senior_hr
      can :index, Candidate
      can :show, Candidate
      can :edit, Candidate
      can :create, Comment
      can :filter, Candidate
      can :skill, Candidate

    elsif user.has_role? :bde
      can :index, Candidate
      can :show, Candidate
      can :create, Comment
      can :filter, Candidate
      can :skill, Candidate

    elsif user.has_role? :admin
      can :manage, :all
    end
  end
  
end
  