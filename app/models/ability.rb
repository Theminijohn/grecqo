class Ability
  include CanCan::Ability

  def initialize(user)

    user ||= User.new # guest user (not logged in)
    if user.has_role? :admin
      can :manage, :all
    else

      # Player
      can :read, Player
      can :follow, Player
      can :unfollow, Player

      # Alliance
      can :read, Alliance

      # Conquer
      can :read, Conquer

      # Town
      can :read, Town

      # Statuses
      can :read, Status

    end
  end
end
