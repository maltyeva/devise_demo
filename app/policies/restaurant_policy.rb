class RestaurantPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      # scope.where.not(user: user)
      scope.all
    end
  end

  # def new?
  #   create?
  # end

  def create?
    true
  end

  def show?
    true
    # !record.nil?
  end


  # def edit?
  #   update?
  # end


  def update?
    # if @restaurant.user == current_user
    # if record.user == user
    #   return true
    # else
    #   return false
    # end

    # record.user == user ? true : false

    is_owner_or_admin?
  end

  def destroy?
    is_owner_or_admin?
  end

  private

  def is_owner_or_admin?
    record.user == user || user.admin
  end


end
